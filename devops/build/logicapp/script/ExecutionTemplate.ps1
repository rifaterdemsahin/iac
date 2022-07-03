Clear-Host
# it is not a good idea to change the ms template
# todo : Get a better solution than sleep
#use the existing template to deploy
Write-Host "Started IaC Automation Resources Creation"
Write-Host "Create the Resource Group DevOps"

New-AzureRmResourceGroup  -Name DevOps -Location "East Us"
Start-Sleep 10
#cd C:\Projects\pexabo\devops\build\logicapp\script\
Write-Host "Connectors Init as they are core dependency for the workflows"

C:\Projects\pexabo\devops\build\logicapp\script\Deploy-AzureResourceGroup.ps1 -TemplateFile C:\Projects\pexabo\devops\build\logicapp\connectors\visualstudioteamservices.definition.json -TemplateParametersFile C:\Projects\pexabo\devops\build\logicapp\connectors\visualstudioteamservices.parameters.json -ResourceGroupName DevOps -ResourceGroupLocation eastus
Start-Sleep 10
C:\Projects\pexabo\devops\build\logicapp\script\Deploy-AzureResourceGroup.ps1 -TemplateFile C:\Projects\pexabo\devops\build\logicapp\connectors\teams.definition.json -TemplateParametersFile C:\Projects\pexabo\devops\build\logicapp\connectors\teams.parameters.json -ResourceGroupName DevOps -ResourceGroupLocation eastus
Start-Sleep 10

Write-Host "Cascading workflows starting with base workflows"

C:\Projects\pexabo\devops\build\logicapp\script\Deploy-AzureResourceGroup.ps1 -TemplateFile C:\Projects\pexabo\devops\build\logicapp\buildnightly\buildnightly.definition.json -TemplateParametersFile C:\Projects\pexabo\devops\build\logicapp\buildnightly\buildnightly.parameters.json -ResourceGroupName DevOps -ResourceGroupLocation eastus
Start-Sleep 10
C:\Projects\pexabo\devops\build\logicapp\script\Deploy-AzureResourceGroup.ps1 -TemplateFile C:\Projects\pexabo\devops\build\logicapp\buildtriggernightly\buildtriggernightly.definition.json -TemplateParametersFile C:\Projects\pexabo\devops\build\logicapp\buildtriggernightly\buildtriggernightly.parameters.json -ResourceGroupName DevOps -ResourceGroupLocation eastus


Write-Host "Ended IaC Automation Resources Creation"
