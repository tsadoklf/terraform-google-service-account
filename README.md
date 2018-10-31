# Google Cloud Platform Service Account Terraform Module
Terraform module for creating a service account in Google Cloud Platform. The module supports granting multiple roles to the service account and creating a private key. 

## Usage

```ruby
module "service_account_for_cloud_sql" {
    source      = "git@github.com:tsadoklf/terraform-google-service-account.git?ref=master"
    account_id  = "my-service-account-for-cloud-sql"
    desply_name = "my service account for cloud sql"
    roles       = [
        "roles/cloudsql.client", 
        "roles/cloudsql.editor"
    ]
}
```

if you need to create a Kubernetes Secret you can do it as follows: 

```ruby
provider "kubernetes" {
    ...
    ...
    ...
}
resource "kubernetes_secret" "cloudsql-instance-credentials" {
    depends_on      = ["module.service_account_for_cloud_sql"]
    metadata {
        name = "cloudsql-instance-credentials"
    }
    data {
        credentials.json = "${module.service_account_for_cloud_sql.decoded_private_key}"
    }
}

```
