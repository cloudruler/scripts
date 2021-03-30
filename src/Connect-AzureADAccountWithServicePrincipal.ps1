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

    # $pscredential = New-Object -TypeName System.Management.Automation.PSCredential($ApplicationId, (ConvertTo-SecureString $Secret -AsPlainText -Force))
    # Connect-AzureAD -Credential $pscredential -Tenant $TenantId

    $psCred = New-Object System.Management.Automation.PSCredential($ApplicationId, (ConvertTo-SecureString $Secret -AsPlainText -Force))
    Connect-AzAccount -Credential $psCred -TenantId $TenantId -ServicePrincipal
    
    $context = [Microsoft.Azure.Commands.Common.Authentication.Abstractions.AzureRmProfileProvider]::Instance.Profile.DefaultContext
    $aadToken = [Microsoft.Azure.Commands.Common.Authentication.AzureSession]::Instance.AuthenticationFactory.Authenticate($context.Account, $context.Environment, $context.Tenant.Id.ToString(), $null, [Microsoft.Azure.Commands.Common.Authentication.ShowDialog]::Never, $null, "https://graph.windows.net").AccessToken

    $aadToken = ""

    Connect-AzureAD -AadAccessToken $aadToken -AccountId $context.Account.Id -TenantId $context.tenant.id
    
    Get-AzureADUser

    #$pscredential = New-Object -TypeName System.Management.Automation.PSCredential($ApplicationId, (ConvertTo-SecureString $Secret -AsPlainText -Force))
    #Connect-AzureAD -Credential $pscredential -Tenant $TenantId
}


