# ==================================================================
# service account: email, name. unique_id
# ==================================================================

output "email" {
    value       = "${google_service_account.default.email}"
    description = "The e-mail address of the service account."
}
output "name" {
    value       = "${google_service_account.default.name}"
    description = "The fully-qualified name of the service account."
}
output "unique_id" {
    value       = "${google_service_account.default.unique_id}"
    description = "The unique id of the service account."
}

# ==================================================================
# private key and decoded private key
# ==================================================================
output "private_key" {
    value = "${google_service_account_key.default.private_key}"
}

output "decoded_private_key" {
    value = "${base64decode(google_service_account_key.default.private_key)}"
}
