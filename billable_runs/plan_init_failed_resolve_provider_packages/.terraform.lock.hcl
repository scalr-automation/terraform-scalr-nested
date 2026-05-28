# Poisoned lock file: pins hashicorp/null@3.2.4 with an h1 hash that
# does NOT match the real package on the registry. See main.tf in this
# folder for the full failure chain.

provider "registry.terraform.io/hashicorp/null" {
  version     = "3.2.4"
  constraints = "3.2.4"
  hashes = [
    "h1:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=",
  ]
}
