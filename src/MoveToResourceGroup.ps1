terraform state rm azurerm_key_vault.kv
terraform state rm azurerm_resource_group.rg
terraform import azurerm_key_vault.kv /subscriptions/2fb80bcc-8430-4b66-868b-8253e48a8317/resourceGroups/rg-identity/providers/Microsoft.KeyVault/vaults/cloudrulerkvidentity
terraform import azurerm_resource_group.rg /subscriptions/2fb80bcc-8430-4b66-868b-8253e48a8317/resourceGroups/rg-identity

terraform state rm azurerm_key_vault_secret.k8s_ssh_key_private_pem
terraform state rm azurerm_key_vault_secret.k8s_ssh_key_public_openssh
terraform state rm azurerm_key_vault_secret.k8s_ssh_key_public_pem
terraform import azurerm_key_vault_secret.k8s_ssh_key_private_pem https://cloudrulerkvidentity.vault.azure.net/secrets/k8s-ssh-key-private-pem/4a03b856f62c4e74869c7675400f6fdf
terraform import azurerm_key_vault_secret.k8s_ssh_key_public_openssh https://cloudrulerkvidentity.vault.azure.net/secrets/k8s-ssh-key-public-openssh/46138acb9a4849df9e9c981f2e7cf0df
terraform import azurerm_key_vault_secret.k8s_ssh_key_public_pem https://cloudrulerkvidentity.vault.azure.net/secrets/k8s-ssh-key-public-pem/f6a3bc21f4fd4775894201c798ebd40a


$source = "C:\Users\brian\git\cloudruler\infrastructure\sandbox\.terraform\providers\registry.terraform.io\hashicorp\azurerm\2.50.0\windows_amd64\"
md = ""
$destination = C:\Users\brian\git\cloudruler\infrastructure\sandbox\.terraform\providers\registry.terraform.io\hashicorp\azurerm\2.50.0\windows_amd64\terraform-provider-azurerm_v2.50.0_x5.exe
mklink /H  $destination

terraform import 

data.azuread_users.keyvault_admin_users
data.azurerm_client_config.current     
azurerm_key_vault.kv
azurerm_key_vault_secret.k8s_ssh_key_private_pem
azurerm_key_vault_secret.k8s_ssh_key_public_openssh
azurerm_key_vault_secret.k8s_ssh_key_public_pem
azurerm_resource_group.rg

$stateFileJson = terraform show -json | ConvertFrom-Json
$stateFileJson.values.root_module.resources.values.id

#How to move resources in a resource group to another resource group

terraform state rm azurerm_key_vault.kv
terraform state rm azurerm_key_vault.kvnew
terraform state rm azurerm_key_vault_secret.k8s_ssh_key_private_pem
terraform state rm azurerm_key_vault_secret.k8s_ssh_key_public_openssh
terraform state rm azurerm_key_vault_secret.k8s_ssh_key_public_pem
terraform import azurerm_key_vault.kv /subscriptions/2fb80bcc-8430-4b66-868b-8253e48a8317/resourceGroups/rg-identity/providers/Microsoft.KeyVault/vaults/cloudruler

terraform import module.dns_zone_cloudruler_io.azurerm_dns_zone.dns_cloudruler_io /subscriptions/2fb80bcc-8430-4b66-868b-8253e48a8317/resourceGroups/rg-connectivity/providers/Microsoft.Network/dnszones/cloudruler.io
#terraform import module.dns_zone_cloudruler_io.azurerm_dns_ns_record.dns_ns_root /subscriptions/2fb80bcc-8430-4b66-868b-8253e48a8317/resourceGroups/rg-connectivity/providers/Microsoft.Network/dnszones/cloudruler.io/NS/@
terraform import module.dns_zone_cloudruler_io.azurerm_dns_mx_record.dns_mx_root /subscriptions/2fb80bcc-8430-4b66-868b-8253e48a8317/resourceGroups/rg-connectivity/providers/Microsoft.Network/dnszones/cloudruler.io/MX/@
terraform import module.dns_zone_cloudruler_io.azurerm_dns_txt_record.dns_txt_root /subscriptions/2fb80bcc-8430-4b66-868b-8253e48a8317/resourceGroups/rg-connectivity/providers/Microsoft.Network/dnszones/cloudruler.io/TXT/@
terraform import module.dns_zone_cloudruler_io.azurerm_dns_cname_record.dns_cname_m365_autodiscover /subscriptions/2fb80bcc-8430-4b66-868b-8253e48a8317/resourceGroups/rg-connectivity/providers/Microsoft.Network/dnszones/cloudruler.io/CNAME/autodiscover
terraform import module.dns_zone_cloudruler_io.azurerm_dns_cname_record.dns_cname_m365_sip /subscriptions/2fb80bcc-8430-4b66-868b-8253e48a8317/resourceGroups/rg-connectivity/providers/Microsoft.Network/dnszones/cloudruler.io/CNAME/sip
terraform import module.dns_zone_cloudruler_io.azurerm_dns_cname_record.dns_cname_m365_lyncdiscover /subscriptions/2fb80bcc-8430-4b66-868b-8253e48a8317/resourceGroups/rg-connectivity/providers/Microsoft.Network/dnszones/cloudruler.io/CNAME/lyncdiscover
terraform import module.dns_zone_cloudruler_io.azurerm_dns_cname_record.dns_cname_mdm_enterpriseregistration /subscriptions/2fb80bcc-8430-4b66-868b-8253e48a8317/resourceGroups/rg-connectivity/providers/Microsoft.Network/dnszones/cloudruler.io/CNAME/enterpriseregistration
terraform import module.dns_zone_cloudruler_io.azurerm_dns_cname_record.dns_cname_mdm_enterpriseenrollment /subscriptions/2fb80bcc-8430-4b66-868b-8253e48a8317/resourceGroups/rg-connectivity/providers/Microsoft.Network/dnszones/cloudruler.io/CNAME/enterpriseenrollment
terraform import module.dns_zone_cloudruler_io.azurerm_dns_srv_record.dns_srv_m365_sip_tls /subscriptions/2fb80bcc-8430-4b66-868b-8253e48a8317/resourceGroups/rg-connectivity/providers/Microsoft.Network/dnszones/cloudruler.io/SRV/_sip._tls
terraform import module.dns_zone_cloudruler_io.azurerm_dns_srv_record.dns_srv_m365_sip_fedtls /subscriptions/2fb80bcc-8430-4b66-868b-8253e48a8317/resourceGroups/rg-connectivity/providers/Microsoft.Network/dnszones/cloudruler.io/SRV/_sipfederationtls._tcp
terraform import module.dns_zone_cloudruler_io.azurerm_dns_cname_record.dns_cname_www /subscriptions/2fb80bcc-8430-4b66-868b-8253e48a8317/resourceGroups/rg-connectivity/providers/Microsoft.Network/dnszones/cloudruler.io/CNAME/www

#terraform import azurerm_dns_cname_record.dns_cname_wildcard /subscriptions/2fb80bcc-8430-4b66-868b-8253e48a8317/resourceGroups/rg-connectivity/providers/Microsoft.Network/dnszones/cloudruler.io/CNAME/*
#terraform import azurerm_dns_cname_record.dns_cname_wildcard /subscriptions/2fb80bcc-8430-4b66-868b-8253e48a8317/resourceGroups/rg-connectivity/providers/Microsoft.Network/dnszones/cloudruler.io/A/@
#terraform import azurerm_dns_cname_record.dns_cname_wildcard /subscriptions/2fb80bcc-8430-4b66-868b-8253e48a8317/resourceGroups/rg-connectivity/providers/Microsoft.Network/dnszones/cloudruler.io/A/@
