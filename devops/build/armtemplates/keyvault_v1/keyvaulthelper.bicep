param keyvaultname string
param resourcegroup string



resource keyVault 'Microsoft.KeyVault/vaults@2019-09-01' existing = {
  name: keyvaultname
  scope: resourceGroup(resourcegroup)
}

module secret1 'secret.bicep' = {
  name: 'secret1'
  params: {
    mySecret: keyVault.getSecret('adminpassword')
  }
}

module secret2 'secret.bicep' = {
  name: 'secret2'
  params: {
    mySecret: keyVault.getSecret('adminusername')
  }
}




