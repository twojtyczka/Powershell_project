$response = Invoke-RestMethod 'https://api.covid19api.com/summary' -Method 'GET' -Headers $headers

$downloadedTime = $response.Date
$systemTime = Get-Date
$timeDifference = New-TimeSpan -Start $downloadedTime -End $systemTime

if ($timeDifference.Days -lt 1) {
    if ($timeDifference.Hours -lt 1) {
        $time = ("$($timeDifference.Minutes)m")
    } 
    else {
        $time = ("$($timeDifference.Hours)h $($timeDifference.Minutes)m")
    } 
}
else {
    $time = ("$($timeDifference.Days) dni $($timeDifference.Hours)h $($timeDifference.Minutes)m")
}

$result = $response | Select-Object -expand Countries | Select-Object Country, TotalConfirmed, TotalRecovered, TotalDeaths, @{N='Time (since last update)'; e={$time}} | Format-Table
$result