

for ($i = 1;  $i -lt 1000; $i++){
    try{
        $(Test-NetConnection -ComputerName "lap-sharmam69.kryptostudio-networks" -Port 3389  | Select-Object TcpTestSucceeded).TcpTestSucceeded
        Start-Sleep -Seconds 1
    }
    catch{
        
    }
}
$ip = '10.1.1.11'
$port = 389
param($ip,$port)
New-Object System.Net.Sockets.TCPClient -ArgumentList $ip, $port