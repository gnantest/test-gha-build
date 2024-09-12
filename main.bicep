@description('Deploy a storage account with cool access tier')
param storageAccount string

@description('The location for all resources.')
param location string = 'australiaeast'

var resourceToken = toLower(uniqueString(resourceGroup().id, location))
var storageAccountName = '${storageAccount}-${resourceToken}'

resource stg 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    accessTier: 'Cool'
  }
}
