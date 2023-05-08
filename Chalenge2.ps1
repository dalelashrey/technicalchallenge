# Import the required Azure AD and Graph API modules
Install-Module AzureADPreview
Install-Module -name MSAL.PS


$SubscriptionID = Read-Host "Enter Subscription ID"
$vmName = Read-Host "Enter the name of the VM"
$rg =  Read-Host "Enter the name of the resourcegroup for this VM"

$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $ApplicationId, $SecuredPassword
Connect-AzAccount -ServicePrincipal -TenantId $TenantId -Credential $Credential

# Set the subscription context
Set-AzContext -SubscriptionId "$SubscriptionID"

# Get access token to query graph api
$accessToken = (Get-MsalToken -Credential $Credential -tenantID $tenantID | Select-Object -Property AccessToken).AccessToken

# Get the VM resource ID
$vmResourceId = (Get-AzVM -Name $vmName -ResourceGroupName $rg).Id

# Define the Graph API endpoint for the VM
$graphApiEndpoint = "https://management.azure.com/$vmResourceId?api-version=2023-03-01"

# Retrieve the VM metadata using Graph API
$vmMetadata = Invoke-WebRequest -ContentType "application/json" -Headers @{Authorization = "Bearer $token"} -Uri $graphApiEndpoint

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
