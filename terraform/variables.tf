variable "google_project" {
  type        = string
  default     = "helmet-319518"
  description = "Google Project to deploy cluster"
}

variable "region" {
  type        = string
  default     = "asia-southeast1"
  description = "GCP region to deploy clusters."
}

variable "cluster_name" {
  type        = string
  default     = "hashimash"
  description = "Name of cluster."
}

variable "username" {
  type        = string
  default     = "admin"
  description = "Username for GKE clusters"
}

variable "password" {
  type        = string
  description = "Password for GKE clusters"
}

variable "enable_consul_and_vault" {
  type        = bool
  default     = true
  description = "Enable consul and vault for the secrets cluster"
}

######################
# Consul configs
######################
variable "namespace" {
  type        = string
  default     = "hashicorp-helmet"
  description = "Namespace to deploy the Consul Helm chart"
}

variable "release_name" {
  type        = string
  default     = "hashicorp-helmet"
  description = "Helm Release name for Consul chart"
}

variable "replicas" {
  type        = number
  default     = 3
  description = "Number of consul replicas"
}