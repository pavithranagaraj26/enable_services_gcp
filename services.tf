provider "google-beta" {
  project = "var.project"
  # credentials = file("tf-sa.json")
#   region  = "var.region"
#   zone    = "var.zone"
}

# resource "google_project_service" "project" {
#   project = var.project_id
#   service = "compute.googleapis.com"
# }
# module "project-services" {
#   source  = "terraform-google-modules/project-factory/google//modules/project_services"
#   version = "10.1.1"
#   project_id                  = var.project_id
#   activate_apis = [
#     "compute.googleapis.com",
#     "iam.googleapis.com",
#   ]
# }


# Enable services in newly created GCP Project.
# resource "google_project_service" "gcp_services" {
#   count   = length(var.gcp_service_list)
#   project = var.project_id
#   service = var.gcp_service_list[count.index]

#   disable_dependent_services = true
# }

variable "project_id" {
  description = "The numeric organization id."
  default = "<project_id>"
}

variable "gcp_service_list" {
  description = "List of GCP service to be enabled for a project."
  type        = list
}

# module "enables-google-apis" {
#   source  = "terraform-google-modules/project-factory/google//modules/project_services"
#   version = "6.0.0"

#   project_id = var.project_id

#   activate_apis = [
#     "iam.googleapis.com",
#     "cloudresourcemanager.googleapis.com",
#     "compute.googleapis.com",
#     "containerregistry.googleapis.com",
#     "container.googleapis.com",
#     "storage-component.googleapis.com",
#     "logging.googleapis.com",
#     "monitoring.googleapis.com",
#   ]
# }

# Enable services in newly created GCP Project.
resource "google_project_service" "gcp_services" {
  count   = length(var.gcp_service_list)
  project = var.project_id
  service = var.gcp_service_list[count.index]

  disable_dependent_services = true
}
