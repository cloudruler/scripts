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
    $TenantId,
    [Parameter(Mandatory=$true)]
    [string]
    $SubscriptionName
)
process {

    $pscredential = New-Object -TypeName System.Management.Automation.PSCredential($ApplicationId, (ConvertTo-SecureString $Secret -AsPlainText -Force))
    Connect-AzAccount -ServicePrincipal -Credential $pscredential -Tenant $TenantId -Subscription $SubscriptionName

}


