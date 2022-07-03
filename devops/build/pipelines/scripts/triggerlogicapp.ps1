$hash = @{ Number = 1; Shape = "Square"; Color = "Blue"} #read them from the caller, add them to the dictionary
#get the file for the arm template and send the file the logic app text to parameter
Start-AzLogicApp -ResourceGroupName "DevOps" -Name "containerregistrycreate" -TriggerName "manual" -Parameters $hash