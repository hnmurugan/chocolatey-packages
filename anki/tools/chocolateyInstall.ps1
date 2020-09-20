$checksum = 'd90a1ac70821da657006c05d00b8368fa61b9f2c1b0895c516542f093194d8f3'
$url = 'https://github.com/ankitects/anki/releases/download/2.1.33/anki-2.1.33-windows.exe'

Install-ChocolateyPackage `
	-PackageName 'anki' `
	-FileType 'exe' `
	-SilentArgs '/S'  `
	-Url $url `
	-Checksum $checksum `
	-ChecksumType 'sha256'
