[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]
    $ApplicationId,
    [Parameter(Mandatory=$true)]
    [string]
    $Secret,
    [Parameter(Mandatory=$true)]
    [string]
    $TenantId
)
process {

    $pscredential = New-Object -TypeName System.Management.Automation.PSCredential($ApplicationId, (ConvertTo-SecureString $Secret -AsPlainText -Force))
    Connect-AzureAD -Credential $pscredential -Tenant $TenantId
}


