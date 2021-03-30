#install WSL
[CmdletBinding()]
param(
    [Parameter(Mandatory=$false)]
    [string]
    $VaultName = "cloudruler",
    [Parameter(Mandatory=$true)]
    [SecureString]
    $Password,
    [Parameter(Mandatory=$false)]
    [string[]]
    $Certificates =("root","ca-kubernetes","ca-kubernetes-front-proxy","ca-etcd","ca-certificate-manager"),
    [Parameter(Mandatory=$false)]
    [string]
    $CertificateDirectory = "/mnt/c/Users/brian/git/cloudruler/infrastructure/scripts/vaultcerts"
)
process {

    $Certificates | ForEach-Object {

        $certName = $_
        $cert = Get-AzKeyVaultCertificate -VaultName $VaultName -Name $certName
        $secret = Get-AzKeyVaultSecret -VaultName $VaultName -Name $cert.Name -AsPlainText
        $secretByte = [Convert]::FromBase64String($secret)
        #The certificate is downloaded unencrypted, so pass a blank password
        $x509Cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2($secretByte, "", "Exportable,PersistKeySet")
        $type = [System.Security.Cryptography.X509Certificates.X509ContentType]::Pfx
        $pfxFileByte = $x509Cert.Export($type, $Password)
        $plainTextPassword = ConvertFrom-SecureString -SecureString $Password -AsPlainText
        try {
            Write-Host "Writing encoded bytes to full path at $CertificateDirectory/$certName.pfx"
            #Write to a file
            [System.IO.File]::WriteAllBytes("$CertificateDirectory/$certName.pfx", $pfxFileByte)
        }
        catch {
            Write-Error "An error occurred";
            Write-Error $_;
        }

    
        #Certificate
        Write-Host "Extracting certificate to pem"
        openssl pkcs12 -in "$CertificateDirectory/$certName.pfx" -out "$CertificateDirectory/$certName.pem" -passin "pass:$plainTextPassword" -nokeys -clcerts
        #Private key unencrypted
        Write-Host "Extracting key to pem"
        openssl pkcs12 -in "$CertificateDirectory/$certName.pfx" -out "$CertificateDirectory/$certName-key.pem" -passin "pass:$plainTextPassword" -nocerts -nodes

        #Print details of the certificate
        Write-Host "Reading certificate pem"
        openssl x509 -in "$CertificateDirectory/$certName.pem" -text -noout
    }
}

# $certName = "root"
# #Certificate
# wsl openssl pkcs12 -in "$certName.pfx" -out "$certName-test.pem" -nokeys -clcerts
# #Private key unencrypted
# wsl openssl pkcs12 -in "$certName.pfx" -out "$certName-test-key.pem" -nocerts -nodes

# #Print details of the certificate
# wsl openssl x509 -in "$certName-test.pem" -text -noout