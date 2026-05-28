# Syntactically valid lock file with multiple semantic problems:
#   * Unrecognized hash schemes (`xx:`, `yy:`, `zz:` — only `h1:` and `zh:`
#     are accepted by terraform/tofu).
# Each invalid hash entry counts as one problem, so tofu/terraform rejects
# the file with "failed to read dependency lock file: N problems",
# producing a plan_init_failed run that must be non-billable.

provider "registry.terraform.io/hashicorp/null" {
  version     = "3.2.4"
  constraints = "~> 3.0"
  hashes = [
    "xx:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=",
    "yy:bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb=",
    "zz:ccccccccccccccccccccccccccccccccccccccccccc=",
  ]
}
