variable "gke_project" {
description = "Google Project ID."
type        = string
}

variable "gke_name" {
description = "GKE cluster name."
type        = string
}

variable "gke_location" {
description = "Google GKE region"
type        = string
#default     = "us-east4"
}
