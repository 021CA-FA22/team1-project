## Creating users for DBAdmin (group)
resource "aws_iam_user" "dbadmin_users" {
  count = length(var.dbadmin_users)
  name  = element(var.dbadmin_users, count.index)
}

## Creating users for Monitor (group)
resource "aws_iam_user" "monitor_users" {
  count = length(var.monitor_users)
  name  = element(var.monitor_users, count.index)
}

## Creating users for Sysadmin (group)
resource "aws_iam_user" "sysadmin_users" {
  count = length(var.sysadmin_users)
  name  = element(var.sysadmin_users, count.index)
}

## Creating group for DBAdmin (group)
resource "aws_iam_group" "DBAdmin_group" {
  name = "DBAdmin_group"
}

## Creating group for Monitor (group)
resource "aws_iam_group" "Monitor_group" {
  name = "Monitor_group"
}

## Creating group for Sysadmin (group)
resource "aws_iam_group" "Sysadmin_group" {
  name = "Sysadmin_group"
}

## Attach users to DBAdmin (group)
resource "aws_iam_group_membership" "DBAdmin_group_attachment" {
  name  = "DBAdmin-group-attachment"
  count = length(var.dbadmin_users)
  users = [element(aws_iam_user.dbadmin_users.*.name, count.index)]
  group = aws_iam_group.DBAdmin_group.name
}

## Attach users to Monitor (group)
resource "aws_iam_group_membership" "Monitor_group_attachment" {
  name  = "Monitor-group-attachment"
  count = length(var.monitor_users)
  users = [element(aws_iam_user.monitor_users.*.name, count.index)]
  group = aws_iam_group.Monitor_group.name
}

## Attach users to Sysadmin (group)
resource "aws_iam_group_membership" "Sysadmin_group_attachment" {
  name  = "Sysadmin-group-attachment"
  count = length(var.sysadmin_users)
  users = [element(aws_iam_user.sysadmin_users.*.name, count.index)]
  group = aws_iam_group.Sysadmin_group.name
}

## Attaching policy to DBAdmin (group)
resource "aws_iam_group_policy_attachment" "DBAdmin_policy_attach" {
  group      = aws_iam_group.DBAdmin_group.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

## Attaching policy to Monitor (group)
resource "aws_iam_group_policy_attachment" "Monitor_policy_attach" {
  group      = aws_iam_group.Monitor_group.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

## Attaching policy to Sysadmin (group)
resource "aws_iam_group_policy_attachment" "Sysadmin_policy_attach" {
  group      = aws_iam_group.Sysadmin_group.name
  policy_arn = "arn:aws:iam::aws:policy/SystemAdministrator"
}