Function TestTCP { Param($address, $port, $timeout=100)
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
            Write-Host "Connection Passed" -ForegroundColor Green
            
        }
    }
    catch {
        Write-Host "Connection Failed" -ForegroundColor Red
        Write-Host -NoNewLine "`a"
        [System.Console]::Beep(1000,200);
    }
    Start-Sleep -Seconds 1
}