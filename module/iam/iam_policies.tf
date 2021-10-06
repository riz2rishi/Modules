
#policy statement in form of terraform doc
data "aws_iam_policy_document" "example" {
  statement {
    actions   = [var.policy_data.actions]
    resources = [var.policy_data.resources]
    effect    = var.policy_data.effect
  }

}

#new policy , Policy doc converted to json
resource "aws_iam_policy" "policy" {
  name        = "${random_pet.pet_name.id}-policy"
  description = "My test policy"

  policy = data.aws_iam_policy_document.example.json
}



