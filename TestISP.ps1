
    for ($i = 1;  $i -lt 1000; $i++){
        try{
            $((Invoke-RestMethod -Uri "https://ipinfo.io/" -UseBasicParsing -TimeoutSec 2| Select-Object org).org).Split(" ",2)[1]
        }
        catch{
            
        }
    }   
    
