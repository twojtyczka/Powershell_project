param($sciezka)

if (-not(Test-Path -Path C:\baza.txt -PathType Leaf)) {
    $dataskr = New-Item C:\baza.txt | Foreach {$_.LastWriteTime}
}
else {
    $dataskr = Get-Item C:\baza.txt | Foreach {$_.LastWriteTime}
}

if (-not(Test-Path -Path C:\historiaSciezek.txt -PathType Leaf)) {
    $historia = New-Item C:\historiaSciezek.txt | Foreach {$_.LastWriteTime}
}
else {
    $historia = Get-Item C:\historiaSciezek.txt | Foreach {$_.LastWriteTime}
}

Write-Output $dataskr
$czas = Get-Date -Format "MM/dd/yyyy HH:mm:ss"
$czas | Out-File -FilePath C:\baza.txt -Append

Add-Content -Path C:\baza.txt -Value "Powyzej znajduje sie data i godzina wyszukiwania duplikatow."
Add-Content -Path C:\baza.txt -Value ""

Write-Output $historia
$sciezka | Out-File -FilePath C:\historiaSciezek.txt -Append
$czas2 = Get-Date -Format "MM/dd/yyyy HH:mm:ss"
$czas2 | Out-File -FilePath C:\historiaSciezek.txt -Append

$cont = Get-Content C:\historiaSciezek.txt | ForEach-Object {
    if($cont -match $sciezka) {
        $czaswPliku = [DateTime]::ParseExact($dateString, "MM/dd/yyyy HH:mm:ss")
        $pliki = Get-ChildItem $sciezka -recurse | Where-Object { $_.LastWriteTime -gt ($czaswPliku) }
    }
    else {
        $pliki = Get-ChildItem $sciezka -recurse
    }
}

$wszystkiepliki = $pliki | Select-Object -Property Name, CreationTime, LastAccessTime, LastWriteTime
$wszystkiepliki | Out-File -FilePath C:\baza.txt -Append

$ilosc = $pliki | Get-FileHash | Group-Object -Property Name, Hash | Where-Object Count -GT 1
 
if ($ilosc.count -lt 1) {
    Add-Content -Path C:\baza.txt -Value "W danym katalogu nie ma zduplikowanych plikow."
    Add-Content -Path C:\baza.txt -Value ""
}
 
else {
    Add-Content -Path C:\baza.txt -Value "Lista duplikatow:"
    $wynik = foreach ($zdubl in $ilosc) {
         $zdubl.Group | Select-Object -Property Path, Hash
    }
    $wynik | Out-File -FilePath C:\baza.txt -Append | Format-Table
}

Write-Host ""
Write-Host "Przejdz do pliku baza.txt, aby zobaczyc czy w danym katalogu sa duplikaty."