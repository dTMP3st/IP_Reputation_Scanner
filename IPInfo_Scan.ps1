Clear-Host

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

# IP Address insert:
$IP_Address = Read-Host -Prompt "Informe o IP "

# Clear screen:
Clear-Host

# IP Address:
# $IP01 = Invoke-WebRequest -Uri "https://ipinfo.io/$IP_Address"
# $IP02= $IP01.Content | cut -f 3 -d '"'
# $IPResponse = $IP02.Replace(",","")

# Hostname:
$Hostname01 = Invoke-WebRequest -Uri "https://ipinfo.io/$IP_Address"
$Hostname02 = $Hostname01.Content | grep -I -N hostname
$Hostname03 = $Hostname02 | cut -f 2 -d ":"
$Hostname04 = $Hostname03.Replace(",","")
$HostnameResponse = $Hostname04.Replace('"',"")

# Anycast:
# $Anycast01 = Invoke-WebRequest -Uri "https://ipinfo.io/$IP_Address"
# $Anycast02 = $Anycast01.Content | grep -I -N anycast
# $Anycast03 = $Anycast02 | cut -f 2 -d ":"
# $AnycastResponse = $Anycast03.Replace(",","")

# City:
$City01 = Invoke-WebRequest -Uri "https://ipinfo.io/$IP_Address"
$City02 = $City01.Content | grep -I -N city
$City03 = $City02 | cut -f 2 -d ":"
$City04 = $City03.Replace(",","")
$CityResponse = $City04.Replace('"',"")

# Region:
$Region01 = Invoke-WebRequest -Uri "https://ipinfo.io/$IP_Address"
$Region02 = $Region01.Content | grep -I -N region
$Region03 = $Region02 | cut -f 2 -d ":"
$Region04 = $Region03.Replace(",","")
$RegionResponse = $Region04.Replace('"',"")

# Country:
$Country01 = Invoke-WebRequest -Uri "https://ipinfo.io/$IP_Address"
$Country02 = $Country01.Content | grep -I -N country
$Country03 = $Country02 | cut -f 2 -d ":"
$Country04 = $Country03.Replace(",","")
$CountryResponse = $Country04.Replace('"',"")

# Geolocalization:
$Geolocation01 = Invoke-WebRequest -Uri "https://ipinfo.io/$IP_Address"
$Geolocation02 = $Geolocation01.Content | grep -I -N loc
$Geolocation03 = $Geolocation02 | cut -f 2 -d ":"
$Geolocation04 = $Geolocation03.Replace(",","")
$GeolocationResponse = $Geolocation04.Replace('"',"")

# Organization:
$Organization01 = Invoke-WebRequest -Uri "https://ipinfo.io/$IP_Address"
$Organization02 = $Organization01.Content | grep -I -N org
$Organization03 = $Organization02 | cut -f 2 -d ":"
$Organization04 = $Organization03.Replace(",","")
$OrganizationResponse = $Organization04.Replace('"',"")

# Postal Code:
$PostalCode01 = Invoke-WebRequest -Uri "https://ipinfo.io/$IP_Address"
$PostalCode02 = $PostalCode01.Content | grep -I -N postal
$PostalCode03 = $PostalCode02 | cut -f 2 -d ":"
$PostalCode04 = $PostalCode03.Replace(",","")
$PostalCodeResponse = $PostalCode04.Replace('"',"")

# Timezone:
$Timezone01 = Invoke-WebRequest -Uri "https://ipinfo.io/$IP_Address"
$Timezone02 = $Timezone01.Content | grep -I -N timezone
$Timezone03 = $Timezone02 | cut -f 2 -d ":"
$Timezone04 = $Timezone03.Replace(",","")
$TimezoneResponse = $Timezone04.Replace('"',"")

# Read-Me:
# $Readme01 = Invoke-WebRequest -Uri "https://ipinfo.io/$IP_Address"
# $Readme02 = $Readme01.Content | grep -I -N readme
# $Readme03 = $Readme02 | cut -f 2 -d ":"
# $ReadmeResponse = $Readme03.Replace(",","")

Write-Output "<================================ IPInfo Status ================================>"
Write-Output ""
# Write-Output "              IP Address                =>$IPResponse"
Write-Output "              Hostname                  =>$HostnameResponse"
# Write-Output "              Anycast                   =>$AnycastResponse"
Write-Output "              City                      =>$CityResponse"
Write-Output "              Region                    =>$RegionResponse"
Write-Output "              Country                   =>$CountryResponse"
Write-Output "              Geolocation               =>$GeolocationResponse"
Write-Output "              Organization              =>$OrganizationResponse"
Write-Output "              Postal Code               =>$PostalCodeResponse"
Write-Output "              Timezone                  =>$TimezoneResponse"
# Write-Output "              Read-Me                   =>$ReadmeResponse"
Write-Output ""
Write-Output "<===============================================================================>"
