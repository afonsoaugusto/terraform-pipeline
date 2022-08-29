
# 1

locals {
  tags = {
    Name          = "Demo-Terraform"
    ProvisionedBy = "Terraform"
  }
}

output "tags" {
  value       = local.tags
  description = "Atributos padrão"
  sensitive   = false
}


variable "NameParameter" {
  type        = string
  description = "Nome do parametro do SSM"
  default     = "foo"
}

variable "ValueParameter" {
  type        = string
  description = "Valor do parametro do SSM"
  default     = "bar"
}


# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter
resource "aws_ssm_parameter" "foo" {
  name  = var.NameParameter
  type  = "String"
  value = var.ValueParameter
  tags  = local.tags
}

output "ssm_parameter" {
  value       = aws_ssm_parameter.foo.arn
  description = "Conteudo do recurso do SSM."
  sensitive   = false
}
