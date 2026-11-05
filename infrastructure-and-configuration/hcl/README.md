# HCL

HashiCorp Configuration Language (HCL) is a human-readable configuration language used by Terraform, Packer, Nomad, and other infrastructure tools. It supports typed values, expressions, blocks, and reusable configuration patterns.

## Example

The example exposes a greeting as a Terraform output without provisioning infrastructure.

Run: `terraform init` followed by `terraform apply -auto-approve`

Learn more in the [HCL documentation](https://developer.hashicorp.com/terraform/language/syntax/configuration).

## Concise introduction

[examples.tf](./examples.tf) uses Terraform 1.3+ typed inputs, validation, object
lists, maps, locals, for expressions, filtering, conditionals, interpolation, and
built-in functions. These are declarative expressions, not custom functions or
imperative loops. Every variable, local, and output uses an example-prefixed name
so this file coexists with the existing configuration.

From this directory run `terraform init -backend=false`, `terraform validate`,
then `terraform plan -refresh=false`. No providers or resources are declared;
the plan shows the existing greeting and the new example_summary output.
To explore the branch, run
`terraform plan -refresh=false -var="example_environment=production"`.
Previewing the plan needs no apply and provisions no infrastructure. The default
report contains API/worker labels and ports 8080 and 8443.
