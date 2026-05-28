# Lock file pins `hashicorp/null` v3.2.4 with an h1 hash that does NOT
# match the real package on the registry. terraform/tofu downloads the
# provider, recomputes its h1 hash, sees the mismatch, and fails init
# with "Failed to resolve provider packages: the dependency lock file
# does not list any hashes that match the package". The resulting run
# maps to plan_init_failed and must be non-billable.

provider "registry.terraform.io/hashicorp/null" {
  version     = "3.2.4"
  constraints = "~> 3.0"
  hashes = [
    "h1:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=",
  ]
}
