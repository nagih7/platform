locals {
  configuration = yamldecode(file("architecture.yml"))
}
