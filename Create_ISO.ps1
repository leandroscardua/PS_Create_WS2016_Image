# Create the ISO image
$DevToolsDirectory = "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\"
$FolderPath = "C:\WS2016\OS"
$ISO = 'C:\WS2016\WS2016.iso'
 
$command = $(Join-Path $DevToolsDirectory 'amd64\Oscdimg\oscdimg.exe')
$arguments = '-m','-o','-u2','-udfver102',"-bootdata:2#p0,e,b$(Join-Path $FolderPath 'boot\etfsboot.com')#pEF,e,b$(Join-Path $FolderPath 'efi\microsoft\boot\efisys.bin')",$FolderPath,$ISO
 
& $command $arguments

