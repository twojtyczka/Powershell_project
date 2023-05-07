$memory = Get-CimInstance -Class CIM_LogicalDisk
$CpuLoad = (Get-WmiObject win32_processor | Measure-Object -property LoadPercentage -Average | Select Average ).Average

while (1) {

foreach ($drive in $memory) {

Write-Host ""
Write-Host "Drive " $drive.Name
$size1 = [math]::round($drive.Size/1GB)
Write-Host "Total disk size: " $size1 "GB"
$size2 = [math]::round($drive.FreeSpace/1GB)
Write-Host "Free disk size: " $size2 "GB"

if ($size2 -lt $size1*0.05) {
            
            $wshell = New-Object -ComObject Wscript.Shell 
            $Output = $wshell.Popup("Usun zbedne pliki z dysku, aby zwiekszyc dostepne miejsce.", 10, "Konczy Ci sie miejsce na dysku $($drive.Name)", 64)
           
        }
}

Write-Host ""
Write-Host "Uzycie procesora wynosi:" $CpuLoad "%"

if ($CpuLoad -gt 30) {
            $wshell = New-Object -ComObject Wscript.Shell 
            $Output = $wshell.Popup("Uzycie procesora wynosi $($CpuLoad) %.", 10, "Uzycie procesora jest wieksze niz 30 %", 64)
}

Wait-Event -timeout 15

}