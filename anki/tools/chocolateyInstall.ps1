$checksum = '36690689bb4869956f801d126c47133a43c328c3b0adee2f8bba45d489e9405b'
$url = 'https://github.com/ankitects/anki/releases/download/2.1.33/anki-2.1.33-windows.exe'

Install-ChocolateyPackage `
	-PackageName 'anki' `
	-FileType 'exe' `
	-SilentArgs '/S'  `
	-Url $url `
	-Checksum $checksum `
	-ChecksumType 'sha256'
