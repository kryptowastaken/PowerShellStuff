Function TestTCP { Param($address, $port, $timeout=300)
    $socket=New-Object System.Net.Sockets.TcpClient
    try {
        $result=$socket.BeginConnect($address, $port, $NULL, $NULL)
        if (!$result.AsyncWaitHandle.WaitOne($timeout, $False)) {
            throw [System.Exception]::new('Connection Timeout')
        }
        $socket.EndConnect($result) | Out-Null
        $socket.Connected
    }
    finally {
        $socket.Close()
    }
}
for ($i = 1;  $i -lt 1000; $i++){
    try {
        if(TestTCP lap-sharmam69.kryptostudio-networks 3389){
            Write-Host "Connection Passed at $(Get-Date -Format 'dd/MM/yyyy h:mm tt')" -ForegroundColor Green 
            
        }
    }
    catch {
        Write-Host "Connection Failed at $(Get-Date -Format 'dd/MM/yyyy h:mm tt')" -ForegroundColor Red
        Write-Host -NoNewLine "`a"
        [System.Console]::Beep(50,200);
        [System.Console]::Beep(60,200);
    }
    Start-Sleep -Seconds 1
}