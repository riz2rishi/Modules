# Creating an organization in the configured account(with some service principals)

resource "aws_organizations_organization" "org" {
  aws_service_access_principals = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
    "guardduty.amazonaws.com",
    "servicecatalog.amazonaws.com"
  ]
  enabled_policy_types=var.aws_enabled_policy
  feature_set = "ALL"
}

# various other policy types can be enabled by the  enabled_policy_types attribute



# adding organizational units (Security Account)
resource "aws_organizations_organizational_unit" "prod" {
  name      = var.aws_OU_name[0]
  parent_id = aws_organizations_organization.org.roots[0].id
}


/*
resource "aws_organizations_account" "account_user3" {
  name  = var.aws_account_Org_usr[0]
  email = var.aws_account_Org_usr_email[0]
  depends_on = [
    aws_organizations_organization.org,
    aws_organizations_organizational_unit.prod

  ]

  parent_id = aws_organizations_organizational_unit.prod.id
}

#Delegating the user as admin for security account

resource "aws_organizations_delegated_administrator" "security_usr_admin" {
  account_id = aws_organizations_account.account_user3.id
  service_principal = "guardduty.amazonaws.com"
}
*/
##########################################################################################################
#######################################Log Archive Account################################################
##########################################################################################################

# adding organizational units (Log Archive Account)
resource "aws_organizations_organizational_unit" "Log_Arch" {
  name      = var.aws_OU_name[1]
  parent_id = aws_organizations_organization.org.roots[0].id
}

/*
resource "aws_organizations_account" "account_log" {
  name  = var.aws_account_Org_usr[1]
  email = var.aws_account_Org_usr_email[1]
  depends_on = [
    aws_organizations_organization.org,
    aws_organizations_organizational_unit.Log_Arch

  ]

  parent_id = aws_organizations_organizational_unit.Log_Arch.id
}

#Delegating the user as admin

resource "aws_organizations_delegated_administrator" "log_usr_admin" {
  account_id = aws_organizations_account.account_log.id
  service_principal = "config.amazonaws.com"
}

*/

##########################################################################################################
#######################################Shared Services Account#############################################
##########################################################################################################

# adding organizational units (Shared Services Account)
resource "aws_organizations_organizational_unit" "ssa" {
  name      = var.aws_OU_name[2]
  parent_id = aws_organizations_organization.org.roots[0].id
}

/*
resource "aws_organizations_account" "account_ssa" {
  name  = var.aws_account_Org_usr[2]
  email = var.aws_account_Org_usr_email[2]
  depends_on = [
    aws_organizations_organization.org,
    aws_organizations_organizational_unit.ssa

  ]

  parent_id = aws_organizations_organizational_unit.ssa.id
}

#Delegating the user as admin

resource "aws_organizations_delegated_administrator" "ssa_usr_admin" {
  account_id = aws_organizations_account.account_ssa.id
  service_principal = "servicecatalog.amazonaws.com"
}

*/