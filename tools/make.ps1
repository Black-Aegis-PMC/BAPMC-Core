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

    if (Select-String -Pattern "PreBuilt_" -InputObject $pboName -SimpleMatch -Quiet) {
        $addon = $pboName.Replace($modPrefix + "optional_", '')
        $sourcePath = "$projectRoot\optionals\$addon"
    }

    if (!(Test-Path -Path $sourcePath)) {
        if ($PSCmdlet.ShouldProcess("$buildPath\addons\$pboName", "Remove obsolete PBO")) {
            Remove-Item -Path "$buildPath\addons\$pboName"
            Remove-Item -Path "$buildPath\addons\$($pboName).$modPrefix$tag.bisign" -ErrorAction SilentlyContinue
            Write-Output -InputObject "  [$timestamp] Deleting obsolete PBO $pboName"
        }
    }
}

function New-PBO {
    param(
        [Parameter(Mandatory=$True)]
        $Source,
        $Parent = "addons",
        $Prebuilt = $False
    )

    $otherPrefix = ""
    if ($prebuilt) {
        $otherPrefix = "PreBuilt_"
    }

    $component = $source.Name
    $fullPath  = $source.FullName
    $hash      = Get-Hash -Path $fullPath | Select-Object -ExpandProperty Hash
    $binPath   = "$buildPath\$Parent\$modPrefix$otherPrefix$component"

    # If it's a directory, then it doesn't have it's own extension, so add it
    if (!($prebuilt)) {
        $binPath = $binPath + ".pbo"
    }

    if (Test-Path -Path "$cachePath\addons\$component") {
        $cachedHash = Get-Content -Path "$cachePath\addons\$component"

        if ($hash -eq $cachedHash -And @(Test-Path -Path $binPath)) {
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
        Remove-Item -Path $binPath

        if ($prebuilt) {
            Write-Output -InputObject "  [$timestamp] Updating pre-built PBO $component"
            Copy-Item -Path $fullPath -Destination $binPath -Force
            & $armake2 sign $privateKeyFile $binPath
        } else {
            Write-Output -InputObject "  [$timestamp] Updating PBO $component"
            & $armake build -f -w unquoted-string -i "$projectRoot" -i $include $fullPath $binPath
            & $armake2 sign $privateKeyFile $binPath
        }
    } else {

        if ($prebuilt) {
            Write-Output -InputObject "  [$timestamp] Copying pre-built PBO $component"
            Copy-Item -Path $fullPath -Destination $binPath -Force
            & $armake2 sign $privateKeyFile $binPath
        } else {
            Write-Output -InputObject "  [$timestamp] Creating PBO $component"
            & $armake build -f -w unquoted-string -i "$projectRoot" -i $include $fullPath $binPath
            & $armake2 sign $privateKeyFile $binPath
        }
    }

    if ($LastExitCode -ne 0) {
        Write-Error -Message "[$timestamp] Failed to create PBO $component."
    }

    # Store this for later comparisons
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

        foreach ($component in Get-ChildItem -File -Path "$projectRoot\optionals") {
            New-PBO -Source $component -Prebuilt $True
        }

        foreach ($component in Get-ChildItem -Directory -Path "$projectRoot\addons") {
            New-PBO -Source $component
        }

        Remove-Item -Path "$buildPath\*.tmp"
    }

    Set-Location -Path $origLocation

    Copy-SupportFiles
}
Main
