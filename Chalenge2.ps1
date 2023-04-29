# Import the required Azure AD and Graph API modules
Import-Module AzureADPreview
Import-Module AzureAD
Import-Module AzureRM.Profile

# Set the subscription context
Set-AzContext -SubscriptionId "replace_with_subscription_id"

# Authenticate with Azure AD
Connect-AzureAD

# Get the VM name as input
$vmName = Read-Host "Enter the name of the VM"

# Get the VM resource ID
$vmResourceId = (Get-AzVM -Name $vmName).Id

# Define the Graph API endpoint for the VM
$graphApiEndpoint = "https://graph.microsoft.com/v1.0/$vmResourceId"

# Retrieve the VM metadata using Graph API
$vmMetadata = Invoke-RestMethod -Headers @{Authorization = "Bearer $((Get-AzureADAccessToken -Resource 'https://graph.microsoft.com').AccessToken)"} -Uri $graphApiEndpoint

# Convert the metadata to JSON format
$metadataJson = $vmMetadata | ConvertTo-Json

# Output the JSON
Write-Output $metadataJson

# Get the data key as input
$dataKey = Read-Host "Enter the data key to retrieve (or press enter to skip)"

# Retrieve the value of the data key if it is provided
if ($dataKey -ne "") {
    $dataValue = $vmMetadata.$dataKey
    Write-Output "$dataKey: $dataValue"
}
