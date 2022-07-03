param ( 
    [string]$keyvault,   
    [string]$datafile     
)
Write-host " keyvault:"  $keyvault " datafile:" $datafile  

$json = Get-Content -Raw -Path $datafile | ConvertFrom-Json

$json | foreach {
    $_.config | foreach {
        if ($_.type -eq 'secret') {
            Write-host "Adding key keyvault:"  $keyvault
            az keyvault secret set --name $_.name --vault-name $keyvault --value $_.value
            Write-host "Added key"

        }  
    }
}
