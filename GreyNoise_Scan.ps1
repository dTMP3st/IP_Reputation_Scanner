Clear-Host

# Tags GreyNoise:
# IP: IP address that information is about
# Noise: This IP was observed scanning the GreyNoise sensor network. May also be referenced as "seen" but serves the same purpose.
# Riot: Indicates if an IP is part of the RIOT dataset or not.
# Classification: IP Classification - possible options: benign, unknown, malicious
# Name: A dynamic field that provides the "actor" name if NOISE or the "provider" name if RIOT
# Link: A link to the details of this IP on the GreyNoise Visualizer.
# Last_Seen: Date of last observed behavior on the GreyNoise Sensor network (format: YYYY-MM-DD)
# Message: Provides additional error/status information on the request. Generally only used for integrations to determine if a lookup was successful or had an error.

# Reference : https://docs.greynoise.io/docs/community-response
# Reference : https://docs.greynoise.io/reference/get_v3-community-ip

# Import grep command in Windows PowerShell:
New-Alias grep findstr -ErrorAction 'SilentlyContinue'

# Import cut command in Windows PowerShell:
function cut {
    param(
      [Parameter(ValueFromPipeline=$True)] [string]$inputobject,
      [string]$delimiter='\s+',
      [string[]]$field
    )
    process {
      if ($field -eq $null) { $inputobject -split $delimiter } else {
        ($inputobject -split $delimiter)[$field] }
    }
}

# Validate my network:
$MyNetwork = ipconfig | grep -I -N "Endereço IPv4" | cut -f 21 -d " "

# API Key insert:
$API_Key_GreyNoise = "GreyNoise API Key"

# IP Address insert:
$IP_Address = Read-Host -Prompt "Informe o IP "

# Clear screen:
Clear-Host

# Request Response:
$ResponseStatus = Invoke-WebRequest -Uri "https://api.greynoise.io/v3/community/$IP_Address" -Method GET -Headers $headers
Clear-Host
$StatusCode = "$($ResponseStatus.StatusCode)"
if ($StatusCode -eq "200"){ 

# IP Address:
# $headers=@{}
# $headers.Add("Accept", "application/json")
# $headers.Add("key", "$API_Key")
# $IP01 = Invoke-WebRequest -Uri "https://api.greynoise.io/v3/community/$IP_Address" -Method GET -Headers $headers
# $IPResponse = $IP01.Content | cut -f 3 -d '"'

# Noise Status:
$headers=@{}
$headers.Add("Accept", "application/json")
$headers.Add("key", "$API_Key_GreyNoise")
$Noise01 = Invoke-WebRequest -Uri "https://api.greynoise.io/v3/community/$IP_Address" -Method GET -Headers $headers
$Noise02 = $Noise01.Content | cut -f 6 -d '"'
$Noise03 = $Noise02.Replace(",","")
$NoiseResponse = $Noise03.Replace(":","")

# Riot Status:
$headers=@{}
$headers.Add("Accept", "application/json")
$headers.Add("key", "$API_Key_GreyNoise")
$Riot01 = Invoke-WebRequest -Uri "https://api.greynoise.io/v3/community/$IP_Address" -Method GET -Headers $headers
$Riot02 = $Riot01.Content | cut -f 8 -d '"'
$Riot03 = $Riot02.Replace(",","")
$RiotResponse = $Riot03.Replace(":","")

# Classification Status:
$headers=@{}
$headers.Add("Accept", "application/json")
$headers.Add("key", "$API_Key_GreyNoise")
$Classification01 = Invoke-WebRequest -Uri "https://api.greynoise.io/v3/community/$IP_Address" -Method GET -Headers $headers
$Classification02 = $Classification01.Content | cut -f 11 -d '"'
$Classification03 = $Classification02.Replace(",","")
$ClassificationResponse = $Classification03.Replace(":","")

# Name Status:
$headers=@{}
$headers.Add("Accept", "application/json")
$headers.Add("key", "$API_Key_GreyNoise")
$Name01 = Invoke-WebRequest -Uri "https://api.greynoise.io/v3/community/$IP_Address" -Method GET -Headers $headers
$Name02 = $Name01.Content | cut -f 15 -d '"'
$Name03 = $Name02.Replace(",","")
$NameResponse = $Name03.Replace(":","")

# Link:
# $headers=@{}
# $headers.Add("Accept", "application/json")
# $headers.Add("key", "$API_Key_GreyNoise")
# $Link01 = Invoke-WebRequest -Uri "https://api.greynoise.io/v3/community/$IP_Address" -Method GET -Headers $headers
# $LinkResponse = $Link01.Content | cut -f 19 -d '"'

# Last Seen:
$headers=@{}
$headers.Add("Accept", "application/json")
$headers.Add("key", "$API_Key_GreyNoise")
$LastSeen01 = Invoke-WebRequest -Uri "https://api.greynoise.io/v3/community/$IP_Address" -Method GET -Headers $headers
$LastSeenResponse = $LastSeen01.Content | cut -f 23 -d '"'

# Message:
# $headers=@{}
# $headers.Add("Accept", "application/json")
# $headers.Add("key", "$API_Key_GreyNoise")
# $Message01 = Invoke-WebRequest -Uri "https://api.greynoise.io/v3/community/$IP_Address" -Method GET -Headers $headers
# $MessageResponse = $Message01.Content | cut -f 27 -d '"'



if ("unknown" -eq $NameResponse) {
    Write-Output "<========================= GreyNoise Status ==========================>"
    Write-Output ""
#   Write-Output "              IP Address                => $IPResponse"
#   Write-Output ""
    Write-Output "              Noise Status              =>$NoiseResponse"
    Write-Output "              Riot Status               =>$RiotResponse"
    Write-Output "              Classification Status     => $ClassificationResponse"
    Write-Output ""
#   Write-Output "              Link                      => $LinkResponse"
#   Write-Output ""
    Write-Output "              Last Seen                 => $LastSeenResponse"
#   Write-Output ""
#   Write-Output "              Message                   => $MessageResponse"
    Write-Output ""
    Write-Output "<=====================================================================>"
}else{
    Write-Output "<========================= GreyNoise Status =========================>"
    Write-Output ""
#   Write-Output "              IP Address                => $IPResponse"
#   Write-Output ""
    Write-Output "              Noise Status              =>$NoiseResponse"
    Write-Output "              Riot Status               =>$RiotResponse"
    Write-Output "              Classification Status     => $ClassificationResponse"
    Write-Output ""
    Write-Output "              Name Status               => $NameResponse"
    Write-Output ""
#   Write-Output "              Link                      => $LinkResponse"
#   Write-Output ""
    Write-Output "              Last Seen                 => $LastSeenResponse"
#   Write-Output ""
#   Write-Output "              Message                   => $MessageResponse"
    Write-Output ""
    Write-Output "<=====================================================================>"
    }
}
else {
    Write-Output "The IP entered was not found in the GreyNoise database ."
}
