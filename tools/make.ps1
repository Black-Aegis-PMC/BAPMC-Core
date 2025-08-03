param(
	[string] $remove = $False
)

$projectRoot    = Split-Path -Parent $PSScriptRoot
$toolsPath      = "$projectRoot\tools"

# Function to determine if the branch is a development branch
function Is-DevBranch {
    $branch = git rev-parse --abbrev-ref HEAD

    # Detect non-main branches
    if ($branch -notmatch "main") {
        return $true
    }
    return $false
}

# Check if the current branch is a development branch and update the build path accordingly
if (Is-DevBranch) {
    $buildPath = "$projectRoot\.build\@Black Aegis - Core - DEV"
    $cachePath      = "$projectRoot\.build\dev-cache"
    Write-Output "Development branch detected, using build path: $buildPath"
} else {
    $buildPath      = "$projectRoot\.build\@Black Aegis - Core"
    $cachePath      = "$projectRoot\.build\cache"
    Write-Output "Stable branch detected, using build path: $buildPath"
}

$modPrefix      = "BAPMC_"
$downloadUrl    = "https://github.com/KoffeinFlummi/armake/releases/download/v0.6.3/armake_v0.6.3.zip"
$armake2        = "$projectRoot\tools\armake2.exe"
$armake         = "$projectRoot\tools\armake.exe"
$tag = git describe --tag | ForEach-Object {
    if (Is-DevBranch) {
        $_ -replace "-.*-", "-dev-"
    } else {
        $_ -replace "-.*-", "-"
    }
}
$privateKeyFile = "$cachePath\keys\$modPrefix$tag.biprivatekey"
$publicKeyFile  = "$buildPath\keys\$modPrefix$tag.bikey"
$timestamp      = Get-Date -UFormat "%T"
$include        = "$projectRoot\include"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

function Get-FullFileHash {
    param (
        [String] $Algo = "MD5"
    )

    $hashes = @()

    foreach ($file in $input) {
        $string = $file.FullName

        # http://jongurgul.com/blog/get-stringhash-get-filehash/
        $StringBuilder = New-Object System.Text.StringBuilder
        [System.Security.Cryptography.HashAlgorithm]::Create($Algo).ComputeHash([System.Text.Encoding]::UTF8.GetBytes($string)) | ForEach-Object {
            [Void]$StringBuilder.Append($_.ToString("x2"))
        }

        $hash = Get-FileHash -Path $file.FullName -Algorithm $Algo
        $hash.Hash = $hash.Hash + $StringBuilder.ToString()

        $hashes += $hash
    }

    return $hashes
}

function Get-Hash {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$True)]
        [ValidateScript({
            if(Test-Path -Path $_ -ErrorAction SilentlyContinue)
            {
                return $true
            }
            else
            {
                throw "$($_) is not a valid path."
            }
        })]
        [string]$Path,
        [string]$Algo = "MD5"
    )
    $temp = [System.IO.Path]::GetTempFileName()

    if (Test-Path -Path $Path -PathType Container) {
        # Get child-file hashes
        Get-ChildItem -File -Recurse -Path $Path | Get-FullFileHash -Algo $Algo | Select-Object -ExpandProperty Hash | Out-File -FilePath $temp -Append -NoNewline
        # Hash directory in case that has changed
        Get-Item -Path $Path | Get-FileHash -Algorithm $Algo | Out-File -FilePath $temp -Append -NoNewline

        $hash = Get-FileHash -Path $temp -Algorithm $Algo
        Remove-Item -Path $temp

    } elseif (Test-Path -Path $Path -PathType Leaf) {
        $hash = Get-FileHash -Path $Path -Algorithm $Algo

    } else {
        Write-Output -InputObject "  [$timestamp] Get-Hash unknown PathType: $Path"
    }

    $hash.Path = $Path
    return $hash
}

function Get-SupportFiles {
    param (
        [string] $type = $False
    )

    if (Test-Path -Path "$toolsPath\support-files.txt") {
        $supportFilesRegex = Get-Content -Path "$toolsPath\support-files.txt"
    } else {
        $supportFilesRegex = "mod.cpp"
    }

    $supportFiles = @()

    if (Test-Path -Path "$projectRoot\extras") {
        $supportFiles += Get-ChildItem -Path "$projectRoot\extras\*"
    }

    $supportFiles += Get-ChildItem -Path "$projectRoot\*" | Where-Object -FilterScript {$_.Name -match $supportFilesRegex}

    if ($type -ne $False) {
        $supportFilesArray = @()
        foreach ($file in $supportFiles) {
            $supportFilesArray += $file.$($type)
        }

        $supportFilesArray
    } else {
        $supportFiles
    }
}

function Remove-Items {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param()

    $origLocation = Get-Location
    Set-Location -Path "$projectRoot\.build"

    Switch ($remove) {
        "all" {
            if ($PSCmdlet.ShouldProcess("$buildPath", "Remove all items")) {
                Remove-Item -Path "$buildPath" -Recurse -ErrorAction SilentlyContinue
            }
        }
        "extras" {
            $items = Get-SupportFiles -type "Name"
            foreach ($item in $items) {
                if ($PSCmdlet.ShouldProcess("$buildPath\*", "Remove extras")) {
                    Remove-Item -Path "$buildPath\*" -Include $item -Force
                }
            }
        }
        "addons" {
            if ($PSCmdlet.ShouldProcess("$buildPath\addons\*", "Remove addons")) {
                Remove-Item -Path "$buildPath\addons\*" -Force
            }
        }
        "cache" {
            if ($PSCmdlet.ShouldProcess("$cachePath", "Remove cache")) {
                Remove-Item -Path "$cachePath" -Recurse -ErrorAction SilentlyContinue
            }
        }
    }

    Set-Location -Path $origLocation
}

function Compare-Version {
    param(
        [Parameter(Mandatory=$True)]
        $version1,

        [Parameter(Mandatory=$True)]
        $version2
    )

    $version1 = $version1.Split(".") | ForEach-Object {[int] $_}
    $version2 = $version2.Split(".") | ForEach-Object {[int] $_}

    $newer = $False
    for ($i = 0; $i -lt $version1.Length; $i++) {
        if ($version1[$i] -gt $version2[$i]) {
            $newer = $True
            break
        }
    }

    $newer
}

function Get-InstalledArmakeVersion {
    if (Test-Path -Path $armake) {
        $version = & $armake --version
        $version = $version.Substring(1)
    } else {
        $version = "0.0.0"
    }

    $version
}

function Update-Armake {
    [CmdletBinding(SupportsShouldProcess=$True)]
    param(
        [Parameter(Mandatory=$True)]
        [string]$url
    )

    if ($PSCmdlet.ShouldProcess("Update armake")) {
        New-Item -Path "$PSScriptRoot\temp" -ItemType "directory" -Force | Out-Null

        Write-Output -InputObject "Downloading armake..."
        $client = New-Object Net.WebClient
        $client.DownloadFile($url, "$PSScriptRoot\temp\armake.zip")
        $client.dispose()

        Write-Output -InputObject "Download complete, unpacking..."
        Expand-Archive -Path "$PSScriptRoot\temp\armake.zip" -DestinationPath "$PSScriptRoot\temp\armake"
        Remove-Item -Path "$PSScriptRoot\temp\armake.zip"

        if ([Environment]::Is64BitProcess) {
            $binary = Get-ChildItem -Path "$PSScriptRoot\temp\armake" -Include "*.exe" -Recurse | Where-Object {$_.Name -match ".*w64.exe"}
        } else {
            $binary = Get-ChildItem -Path "$PSScriptRoot\temp\armake" -Include "*.exe" -Recurse | Where-Object {$_.Name -match ".*w64.exe"}
        }
        Move-Item -Path $binary.FullName -Destination $armake -Force

        Remove-Item -Path "$PSScriptRoot\temp" -Recurse -Force
    }
}

function New-PrivateKey {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param()

    $cachedKeysPath = Split-Path -Parent $privateKeyFile
    $binKeysPath    = Split-Path -Parent $publicKeyFile

    # Do we need to clean up first?
    if ($PSCmdlet.ShouldProcess("Cleaning up old keys")) {
        if (Test-Path -Path "$binKeysPath\*" -Exclude "$modPrefix$tag.*") {
            Remove-Item -Path "$cachedKeysPath\*" -Exclude "$modPrefix$tag.*"
            Remove-Item -Path "$binKeysPath\*" -Exclude "$modPrefix$tag.*"
            Remove-Item -Path "$buildPath\addons\*.bisign" -Exclude "*$tag.bisign"

            Write-Output -InputObject "  [$timestamp] Cleaning up old keys. Current tag: $tag"
        }
    }

    if ($PSCmdlet.ShouldProcess("Creating key pairs for $tag")) {
        if (!((Test-Path -Path $privateKeyFile) -And (Test-Path -Path $publicKeyFile))) {
            Write-Output -InputObject "  [$timestamp] Creating key pairs for $tag"
            & $armake2 keygen "$buildPath\keys\$modPrefix$tag"

            New-Item -Path "$cachePath\keys" -ItemType "directory" -ErrorAction SilentlyContinue | Out-Null
            Move-Item -Path "$buildPath\keys\$modPrefix$tag.biprivatekey" -Destination $privateKeyFile -Force
        }

        # Re-check the work done above to verify they exist
        if (!((Test-Path -Path $privateKeyFile) -And (Test-Path -Path $publicKeyFile))) {
            Write-Error -Message "[$timestamp] Failed to generate key pairs $privateKeyFile"
        } else {
            Write-Output -InputObject "[$timestamp] Key pair generation succeeded."
        }
    }
}


function Remove-ObsoleteFiles {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [Parameter(Mandatory=$True)]
        $addonPbo
    )

    $pboName = $addonPbo.Name
    $addon = $pboName.Replace($modPrefix, '').Replace('.pbo', '')
    $sourcePath = "$projectRoot\addons\$addon"

    # This logic is preserved from your script to correctly identify the source path for prebuilt/optional files
    if (Select-String -Pattern "PreBuilt_" -InputObject $pboName -SimpleMatch -Quiet) {
        $addon = $pboName.Replace($modPrefix + "optional_", '')
        $sourcePath = "$projectRoot\optionals\$addon"
    }

    # If the source folder/file no longer exists, the built PBO is obsolete
    if (!(Test-Path -Path $sourcePath)) {
        if ($PSCmdlet.ShouldProcess($pboName, "Remove obsolete PBO and any associated signatures/keys")) {

            # --- 1. Attempt to find all associated .bisign files for the obsolete PBO ---
            # Added -ErrorAction SilentlyContinue for extra safety
            $obsoleteBisigns = Get-ChildItem -Path "$buildPath\addons" -Filter "$pboName.*.bisign" -ErrorAction SilentlyContinue

            # --- 2. NEW: Only run signature/key analysis IF signatures were found ---
            if ($obsoleteBisigns) {

                # --- 2a. Determine which BIKEYs might become obsolete ---
                $allBisignsInBuild = Get-ChildItem -Path "$buildPath\addons" -Filter "*.bisign"
                # This is now safe because $obsoleteBisigns is guaranteed not to be null
                $remainingBisigns = Compare-Object -ReferenceObject $allBisignsInBuild -DifferenceObject $obsoleteBisigns -PassThru | Where-Object { $_.SideIndicator -eq "<=" }

                # Extract the key names used by the obsolete signatures
                $keyNamesFromObsolete = $obsoleteBisigns | ForEach-Object {
                    $parts = $_.Name.Split('.')
                    if ($parts.Count -ge 3) { $parts[-2] } # The key name is the second to last part
                } | Select-Object -Unique

                # --- 2b. Remove obsolete BIKEYs if they are no longer used by other files ---
                foreach ($keyName in $keyNamesFromObsolete) {
                    $isKeyInUse = $remainingBisigns | Where-Object { $_.Name -match "\.$keyName\.bisign$" }

                    if (-not $isKeyInUse) {
                        $bikeyPath = Join-Path -Path "$buildPath\keys" -ChildPath "$keyName.bikey"
                        if (Test-Path $bikeyPath) {
                            Write-Output -InputObject "  [$timestamp] Deleting obsolete, unused BIKEY: $keyName.bikey"
                            Remove-Item -Path $bikeyPath -Force
                        }
                    }
                }

                # --- 2c. Remove the obsolete BISIGN files ---
                Write-Output -InputObject "  [$timestamp] Deleting obsolete BISIGN(s) for $pboName"
                Remove-Item -Path $obsoleteBisigns.FullName -Force
            }

            # --- 3. Always remove the obsolete PBO file itself ---
            Write-Output -InputObject "  [$timestamp] Deleting obsolete PBO: $pboName"
            Remove-Item -Path $addonPbo.FullName -Force
        }
    }
}
function Get-PboPrefix {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$True)]
        [string]$AddonPath
    )
    $prefixFile = Join-Path -Path $AddonPath -ChildPath '$PBOPREFIX$'
    if (Test-Path $prefixFile) {
        $prefix = (Get-Content -Path $prefixFile -Raw).Trim()
        return ($prefix -replace '^["''\s]*(.*?)["''\s]*$','$1')
    }
    return $null
}

function Find-AllDependencies {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$True)]
        [string]$FilePath,
        [string]$AddonRootPath,
        [string]$AddonPboPrefix,
        [ref]$processedFiles
    )

    $filesToFind = @()
    if (-not (Test-Path $FilePath) -or ($processedFiles.Value -contains $FilePath)) {
        return $filesToFind
    }

    $processedFiles.Value += $FilePath
    $content = Get-Content -Path $FilePath

    # --- REGEX PATTERNS ---
    $includeRegex = "#include\s*`"(.*?)\`";"
    $assignmentRegex = "\w+\s*=\s*`"(.*?)\`";"
    $initRegex = "init\s*=\s*`"(.*?)\`";"
    $innerPathRegex = "'(.*?)'"
    $functionClassRegex = "class\s+(\w+)\s*{};"

    # --- Process #include directives ---
    foreach ($line in ($content | Select-String -Pattern $includeRegex)) {
        $foundPath = $line.Matches.Groups[1].Value.Replace("/", "\")
        $fullLocalPath = Join-Path -Path $AddonRootPath -ChildPath $foundPath
        $filesToFind += $fullLocalPath
        $filesToFind += Find-AllDependencies -FilePath $fullLocalPath -AddonRootPath $AddonRootPath -AddonPboPrefix $AddonPboPrefix -processedFiles ([ref]$processedFiles.Value)
    }

    # --- Process general assignments (file = "...", texture = "...") ---
    foreach ($line in ($content | Select-String -Pattern $assignmentRegex)) {
        $foundPath = $line.Matches.Groups[1].Value.Replace("/", "\")
        if ($foundPath.StartsWith($AddonPboPrefix)) {
            $relativePath = $foundPath.Substring($AddonPboPrefix.Length).TrimStart("\")
            $fullLocalPath = Join-Path -Path $AddonRootPath -ChildPath $relativePath


            if ($foundPath -notlike "*.*") {
                # Find all nested class definitions and add them to the list
                $startLineIndex = [array]::IndexOf($content, $line.Line)
                if ($startLineIndex -ne -1) {
                    for ($i = $startLineIndex + 1; $i -lt $content.Count; $i++) {
                        $nestedLine = $content[$i]
                        if ($nestedLine -match $functionClassRegex) {
                            $functionName = $matches[1]
                            $expectedFile = Join-Path -Path $fullLocalPath -ChildPath "fn_$functionName.sqf"
                            $filesToFind += $expectedFile
                        }
                        if ($nestedLine -match "};") { break }
                    }
                }
                # Fallback to get all existing .sqf files in the folder if no nested classes are found.
                $filesToFind += Get-ChildItem -Path $fullLocalPath -Filter "*.sqf" -Recurse | Select-Object -ExpandProperty FullName
            } else {
                # This is a file reference with an extension.
                $filesToFind += $fullLocalPath
            }
        }
    }

    # --- Process specific 'init' assignments ---
    foreach ($line in ($content | Select-String -Pattern $initRegex)) {
        $innerMatch = $line.Matches[0].Groups[1].Value | Select-String -Pattern $innerPathRegex
        if ($innerMatch) {
            $foundPath = $innerMatch.Matches.Groups[1].Value.Replace("/", "\")
            if ($foundPath.StartsWith($AddonPboPrefix)) {
                $relativePath = $foundPath.Substring($AddonPboPrefix.Length).TrimStart("\")
                $fullLocalPath = Join-Path -Path $AddonRootPath -ChildPath $relativePath
                $filesToFind += $fullLocalPath
            }
        }
    }

    return $filesToFind | Select-Object -Unique
}

function Validate-AddonFiles {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$True)]
        [string]$AddonPath
    )

    $configPath = Join-Path -Path $AddonPath -ChildPath "config.cpp"
    if (-not (Test-Path $configPath)) {
        Write-Warning "[$timestamp] Skipping validation for '$AddonPath'. No config.cpp found."
        return
    }

    $pboPrefix = Get-PboPrefix -AddonPath $AddonPath
    if (-not $pboPrefix) {
        Write-Warning "[$timestamp] Skipping validation for '$AddonPath'. Could not find $PBOPREFIX$ file."
        return
    }

    Write-Output "[$timestamp] Validating all file dependencies (prefix: '$pboPrefix') starting from: $configPath"

    $processedFiles = @()
    $referencedFiles = Find-AllDependencies -FilePath $configPath -AddonRootPath $AddonPath -AddonPboPrefix $pboPrefix -processedFiles ([ref]$processedFiles)

    $missingFiles = @()

    foreach ($file in $referencedFiles) {
        if (-not (Test-Path $file)) {
            $missingFiles += $file
        }
    }

    if ($missingFiles.Count -gt 0) {
        Write-Host "" # Add a blank line for readability
        Write-Host "[$timestamp] Critical error: The following files are missing from addon '$AddonPath' as referenced in its configuration files:" -ForegroundColor Red
        $missingFiles | ForEach-Object { Write-Host " - $_" -ForegroundColor Red }
        Write-Host ""
        Write-Host "Build failed." -ForegroundColor Red
        exit 1
    }

    Write-Output "[$timestamp] All referenced files for '$AddonPath' found."
}

function Handle-PrebuiltFiles {
    $sourceDir = "$projectRoot\optionals"
    $destAddonsDir = "$buildPath\addons"
    $destKeysDir = "$buildPath\keys"

    if (-not (Test-Path $sourceDir)) {
        return
    }

    Write-Output -InputObject "  [$timestamp] Handling all prebuilt files from: $sourceDir"

    # --- 1. Copy all PBO files to 'addons' ---
    $pboFiles = Get-ChildItem -Path $sourceDir -Filter *.pbo
    if ($pboFiles) {
        Write-Output "Copying all PBOs to addons..."
        foreach ($file in $pboFiles) {
            Write-Output "    -> Copying PBO to addons: $($file.Name)"
            Copy-Item -Path $file.FullName -Destination $destAddonsDir -Force
        }
    }

    # --- 2. Copy all .bisign files to 'addons' ---
    $bisignFiles = Get-ChildItem -Path $sourceDir -Filter *.bisign
    if ($bisignFiles) {
        Write-Output "Copying all BISIGNs to addons..."
        foreach ($file in $bisignFiles) {
            Write-Output "    -> Copying BISIGN to addons: $($file.Name)"
            Copy-Item -Path $file.FullName -Destination $destAddonsDir -Force
        }
    }

    # --- 3. Copy all .bikey files to 'keys' ---
    $bikeyFiles = Get-ChildItem -Path $sourceDir -Filter *.bikey
    if ($bikeyFiles) {
        Write-Output "Copying all BIKEYs to keys folder..."
        foreach ($file in $bikeyFiles) {
            Write-Output "    -> Copying BIKEY to keys folder: $($file.Name)"
            Copy-Item -Path $file.FullName -Destination $destKeysDir -Force
        }
    }
}

function New-PBO {
    param(
        [Parameter(Mandatory=$True)]
        $Source,
        $Parent = "addons"
    )

    $component = $source.Name
    $fullPath  = $source.FullName
    $hash      = Get-Hash -Path $fullPath | Select-Object -ExpandProperty Hash
    $binPath   = "$buildPath\$Parent\$modPrefix$component.pbo"

    if (Test-Path -Path "$cachePath\addons\$component") {
        $cachedHash = Get-Content -Path "$cachePath\addons\$component"
        if ($hash -eq $cachedHash -And (Test-Path -Path $binPath)) {
            if (!(Test-Path -Path "$binPath.$modPrefix$tag.bisign")) {
                Write-Output -InputObject "  [$timestamp] Updating bisign for $component"
                & $armake2 sign $privateKeyFile $binPath
                return
            } else {
                return "  [$timestamp] Skipping $component"
            }
        }
    } else {
        if (!(Test-Path -Path "$cachePath\addons")) {
            New-Item -Path "$cachePath\addons" -ItemType "directory" | Out-Null
        }
    }

    if (Test-Path -Path $binPath) {
        Remove-Item -Path $binPath -Force
        Write-Output -InputObject "  [$timestamp] Updating PBO $component"
    } else {
        Write-Output -InputObject "  [$timestamp] Creating PBO $component"
    }

    & $armake build -f -w unquoted-string -i "$projectRoot" -i $include $fullPath $binPath
    & $armake2 sign $privateKeyFile $binPath

    if ($LastExitCode -ne 0) {
        Write-Error -Message "[$timestamp] Failed to create PBO $component."
    }

    $hash | Out-File -FilePath "$cachePath\addons\$component" -NoNewline
}

function Copy-SupportFiles {
    $supportFiles = Get-SupportFiles

    # Switch from tools dir to projectRoot dir
    $origLocation = Get-Location
    Set-Location -Path $projectRoot

    foreach ($file in $supportFiles) {
        $fileName = Get-ChildItem -Path $file | Select-Object -ExpandProperty Name

        Write-Output -InputObject "  [$timestamp] Copying $fileName"
        Copy-Item -Path $file -Destination $buildPath -Force -Recurse

        if ($LastExitCode -ne 0) {
            Write-Error -Message "[$timestamp] Failed to copy $fileName."
        }
    }

    Set-Location -Path $origLocation
}

function Main {
    if ($remove -ne $False) {
        Remove-Items
        return
    }

    $installed = Get-InstalledArmakeVersion
    $latest    = "0.6.3"  # Hardcoded latest version

    if (Compare-Version -version1 $latest -version2 $installed) {
        Write-Output -InputObject ("Found newer version of armake: Installed: " + $installed + " Latest: " + $latest)
        Update-Armake -url $downloadUrl
        Write-Output -InputObject "Update complete, armake up-to-date."
    }

    New-Item -Path "$buildPath" -ItemType "directory" -Force | Out-Null
    New-Item -Path "$buildPath\keys" -ItemType "directory" -Force | Out-Null

    # Switch from tools dir to buildPath dir
    $origLocation = Get-Location
    Set-Location -Path $buildPath

    New-PrivateKey

    if (Test-Path -Path $privateKeyFile) {
        New-Item -Path "$buildPath\addons" -ItemType "directory" -Force | Out-Null
        New-Item -Path "$projectRoot\optionals" -ItemType "directory" -Force | Out-Null

        foreach ($component in Get-ChildItem -Path "$buildPath\addons\*.pbo") {
            Remove-ObsoleteFiles -addonPbo $component
        }

        Handle-PrebuiltFiles

        # Get all addon directories first
        $addonComponents = Get-ChildItem -Directory -Path "$projectRoot\addons"

        Write-Output "[$timestamp] Starting pre-build file validation..."
        foreach ($component in $addonComponents) {
            Validate-AddonFiles -AddonPath $component.FullName
        }
        Write-Output "[$timestamp] Pre-build file validation complete. All referenced files found."


        foreach ($component in Get-ChildItem -Directory -Path "$projectRoot\addons") {
            New-PBO -Source $component
        }

        Remove-Item -Path "$buildPath\*.tmp"
    }

    Set-Location -Path $origLocation

    Copy-SupportFiles
}
Main
