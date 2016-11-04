﻿[string]$chocoVersion = $(choco --version)
[string]$majorRelease = $chocoVersion.Split('.')[1]
[string]$minorRelease = $chocoVersion.Split('.')[2]
if (-not $majorRelease.Equals("10") -or -not $minorRelease.Equals("3"))
{
    write-host "WARNING: This package has only been tested with Chocolatey 0.10.3" -f "Yellow"
}

$packageName = 'grails'
$packageVersion = $env:chocolateyPackageVersion
$checksum = '62134E359D13D59401FE93F7A30C32D6A3A68943FD2CA8FC483F4A69CC0BB03F'
$url = "https://github.com/grails/grails-core/releases/download/v$packageVersion/grails-$packageVersion.zip"
$toolsDir = Get-ToolsLocation
$grails_home = Join-Path $toolsDir "$packageName-$packageVersion"
 
# Creating bin folder if it is not there yet
New-Item -Path $toolsDir -type directory -Force

Install-ChocolateyZipPackage `
	-PackageName $packageName `
	-Url $url `
	-UnzipLocation $toolsDir `
	-Checksum $checksum `
	-ChecksumType 'sha256'

Install-ChocolateyEnvironmentVariable -VariableName "GRAILS_HOME" -VariableValue $grails_home -VariableType 'Machine'
Install-ChocolateyPath -PathToInstall "$grails_home\bin" -PathType 'Machine'