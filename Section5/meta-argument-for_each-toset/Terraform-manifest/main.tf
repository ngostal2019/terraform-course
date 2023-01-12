resource "aws_iam_user" "tfm_iam_user" {
  for_each = toset(["Staline_N", "Blaise_F", "Ndassi_VF", "S_Victorine", "Ntolo_RM", "Johnnister_W"])
  name     = "${each.key}"
  tags = {
    "${each.key}" = "${each.value}"
    value         = "${each.value}"
    key           = "${each.key}"
  }
}