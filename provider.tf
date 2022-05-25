#Hashicorp Vault used to access the aws envrironment
data "vault_generic_secret" "aws_creds" {
    path = "secret/aws"
}

provider "aws" {
    region     = data.vault_generic_secret.aws_creds.data["region"]
    access_key = data.vault_generic_secret.aws_creds.data["aws_access_key_id"]
    secret_key = data.vault_generic_secret.aws_creds.data["aws_secret_access_key"]
}
