# keyvault

cd c:\Projects\DevOps\build\armtemplates\keyvault_v1\
az login --tenant pexabo.com 
clear
az account set --subscription ab2bae5e-fb62-41c0-824d-1b3ffd223823


az keyvault set-policy --name my-vault-dev --object-id xxxxx --secret-permissions all
