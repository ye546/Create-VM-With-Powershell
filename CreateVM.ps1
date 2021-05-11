$name_of_server = Read-Host -Prompt "Enter server vm name"
[int64]$ram     = 1gb*(Read-Host -prompt "RAM Size (single digit please or watch hell unravel itself")
$newVHDPath     = 'C:\Users\Public\Documents\Hyper-V\Virtual Hard Disks\' + $name_of_server + '.vhdx'
$virtual_switch = Read-Host -prompt 'Enter the name of the virtual network switch'
$path           = 'C:\ProgramData\Microsoft\Windows\Hyper-V\'
$cpu_count      = Read-Host -prompt "Enter the amount of CPU cores to use"
Write-Host "`n`n"


if(New-VM -Name $name_of_server -MemoryStartupBytes $ram -BootDevice VHD -NewVHDPath $newVHDPath -NewVHDSizeBytes 20GB -Generation 2 -switch $virtual_switch -Path $path){
    Write-Host "Server was successfully created.`nDefault RAM size is 4096MB.`nDefault HDD size is 20gb.`nThe location of the new VHD is $newVHDPath.`nThe processor count is $cpu_count.`nDynmic memory is enabled by default.`nThe network switch is '$virtual_switch'.`n`n"
    Set-VM -Name $name_of_server -ProcessorCount $cpu_count -DynamicMemory 
    Read-Host -Prompt "(PRESS ENTER)"
}else{
    Write-Host "The server was not created."
    Read-Host -Prompt "(PRESS ENTER)"
}

