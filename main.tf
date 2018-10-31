resource "google_service_account" "default" {
    account_id   = "${var.account_id}"
    display_name = "${var.display_name}"
}

resource "google_project_iam_member" "default" {
    count   =  "${length(var.roles)}"
    role    =  "${element(var.roles, count.index)}"
    member  = "serviceAccount:${google_service_account.default.email}"
}

resource "google_service_account_key" "default" {
    depends_on          = ["google_service_account.default"]
    service_account_id  = "${google_service_account.default.name}"
}
