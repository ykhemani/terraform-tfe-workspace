variable "tfe_hostname" {
  type        = string
  description = "The Terraform Cloud/Enterprise hostname to connect to. Can be overriden by setting the TFE_HOSTNAME environment variable."
  default     = "app.terraform.io"
}

variable "tfe_org" {
  type        = string
  description = "Terraform Enterprise Organization Name"
}

variable "tfe_ssl_skip_verify" {
  type        = string
  description = "Whether or not to skip certificate verifications. Can be overridden setting by setting the TFE_SSL_SKIP_VERIFY environment variable."
  default     = false
}

variable "workspace_name" {
  type        = string
  description = "Workspace Name"
}

variable "allow_destroy_plan" {
  type        = bool
  description = "Whether destroy plans can be queued on the workspace."
  default     = true
}

variable "auto_apply" {
  type        = bool
  description = "Whether to automatically apply changes when a Terraform plan is successful."
  default     = true
}

variable "queue_all_runs" {
  type        = bool
  description = "Whether the workspace should start automatically performing runs immediately after its creation."
  default     = false
}

variable "global_remote_state" {
  type        = bool
  description = "Whether the workspace allows all workspaces in the organization to access its state data during runs. If false, then only specifically approved workspaces can access its state (remote_state_consumer_ids)."
  default     = true
}

variable "vcs_repo" {
  type        = string
  description = "VCS Repo"
}

variable "vcs_branch" {
  type        = string
  description = "VCS Branch"
  default     = "main"
}

variable "vcs_oauth_token_id" {
  type        = string
  description = "VCS oauth token ID for the VCS connection."
}

variable "slack_notification_url" {
  type        = string
  description = "Slack notification URL for sending Slack notifications."
  default     = ""
}

variable "slack_notification_triggers" {
  type        = list(string)
  description = "The array of triggers for which this notification configuration will send notifications."
  default     = ["run:created", "run:planning", "run:needs_attention", "run:applying", "run:completed", "run:errored"]
}

variable "var_owner" {
  type    = string
  default = ""
}

variable "var_purpose" {
  type    = string
  default = ""
}

variable "var_ttl" {
  type    = string
  default = "1"
}

# azure credentials
variable "azure_credentials" {
  type        = bool
  description = "Whether to create environment variables for Azure credentials."
  default     = false
}

variable "arm_client_id" {
  type    = string
  default = ""
}

variable "arm_tenant_id" {
  type    = string
  default = ""
}

variable "arm_subscription_id" {
  type    = string
  default = ""
}

variable "arm_client_secret" {
  type    = string
  default = ""
}

# aws credentials
variable "aws_credentials" {
  type        = bool
  description = "Whether to create environment variables for AWS credentials."
  default     = false
}

variable "aws_access_key_id" {
  type    = string
  default = ""
}

variable "aws_secret_access_key" {
  type    = string
  default = ""
}

variable "aws_session_token" {
  type    = string
  default = ""
}
