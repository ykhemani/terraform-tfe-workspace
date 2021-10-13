terraform {
  required_providers {
    tfe = {
      version = "~> 0.26"
    }
  }
}
provider "tfe" {
  hostname = var.tfe_hostname
}

resource "tfe_workspace" "workspace" {
  name                = var.workspace_name
  organization        = var.tfe_org
  allow_destroy_plan  = var.allow_destroy_plan
  auto_apply          = var.auto_apply
  queue_all_runs      = var.queue_all_runs
  global_remote_state = var.global_remote_state
  vcs_repo {
    identifier     = var.vcs_repo
    branch         = var.vcs_branch
    oauth_token_id = var.vcs_oauth_token_id
  }
}

resource "tfe_notification_configuration" "notification" {
  name             = var.workspace_name
  enabled          = var.slack_notification_url != "" ? true : false
  destination_type = "slack"
  url              = var.slack_notification_url
  triggers         = var.slack_notification_triggers
  workspace_id     = tfe_workspace.workspace.id
}

resource "tfe_variable" "var_owner" {
  key          = "owner"
  value        = var.var_owner
  category     = "terraform"
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "var_purpose" {
  key          = "purpose"
  value        = var.var_purpose
  category     = "terraform"
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "var_ttl" {
  key          = "ttl"
  value        = var.var_ttl
  category     = "terraform"
  workspace_id = tfe_workspace.workspace.id
}

# azure credentials
resource "tfe_variable" "arm_client_id" {
  count        = var.azure_credentials ? 1 : 0
  key          = "ARM_CLIENT_ID"
  value        = var.arm_client_id
  category     = "env"
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "arm_tenant_id" {
  count        = var.azure_credentials ? 1 : 0
  key          = "ARM_TENANT_ID"
  value        = var.arm_tenant_id
  category     = "env"
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "arm_subscription_id" {
  count        = var.azure_credentials ? 1 : 0
  key          = "ARM_SUBSCRIPTION_ID"
  value        = var.arm_subscription_id
  category     = "env"
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "arm_client_secret" {
  count        = var.azure_credentials ? 1 : 0
  key          = "ARM_CLIENT_SECRET"
  value        = var.arm_client_secret
  category     = "env"
  workspace_id = tfe_workspace.workspace.id
  sensitive    = true
}

# aws credentials
resource "tfe_variable" "aws_access_key_id" {
  count        = var.aws_credentials ? 1 : 0
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.aws_access_key_id
  category     = "env"
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "aws_secret_access_key" {
  count        = var.aws_credentials ? 1 : 0
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.aws_secret_access_key
  category     = "env"
  workspace_id = tfe_workspace.workspace.id
  sensitive    = true
}

resource "tfe_variable" "aws_session_token" {
  count        = var.aws_credentials ? 1 : 0
  key          = "AWS_SESSION_TOKEN"
  value        = var.aws_session_token
  category     = "env"
  workspace_id = tfe_workspace.workspace.id
  sensitive    = true
}
