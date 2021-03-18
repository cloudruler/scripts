[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]
    $VaultName,
    [Parameter(Mandatory=$true)]
    [string]
    $SecretName,
    [Parameter(Mandatory=$true)]
    [string]
    $FileName
)
process {

    $keyFolder = "$HOME/.ssh";
    if($false -eq (Test-Path $keyFolder)) {
        Write-Host "Creating folder '$keyFolder'";
        New-Item -Path $keyFolder -ItemType Directory
    }
    $filePath = [System.IO.Path]::Combine($keyFolder, $FileName)
    Write-Host "Grabbing key vault secret '$keyFolder' and writing it to path $filePath";
    Get-AzKeyVaultSecret -VaultName $VaultName -Name $SecretName |
    ForEach-Object { ConvertFrom-SecureString $_.SecretValue } | 
    Out-File -FilePath $filePath
}

