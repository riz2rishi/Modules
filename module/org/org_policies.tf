
#policy related with the organization
resource "aws_organizations_policy" "policy1" {
  name = "General_Policy"

  depends_on = [aws_organizations_organization.org]

  content = <<CONTENT
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "*",
    "Resource": "*"
  }
}
CONTENT
}


# Attaching AWS Organizations policy to an organization root.
resource "aws_organizations_policy_attachment" "root" {
  policy_id = aws_organizations_policy.policy1.id
  target_id = aws_organizations_organization.org.roots[0].id
}


# Attaching AWS Organizations policy to an organization unit.
resource "aws_organizations_policy_attachment" "unit" {
  policy_id = aws_organizations_policy.policy1.id
  target_id = aws_organizations_organizational_unit.prod.id
}
