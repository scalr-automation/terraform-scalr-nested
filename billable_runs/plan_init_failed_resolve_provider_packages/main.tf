# Poisoned-lockfile template for the e2e test
# tests/e2e/api/billing/test_runs_billable_lockfile_cache_poison.py.
#
# Used together with billable_runs/cache_warmup_null_3_2_4/, which must
# run first so the agent's Provider Cache already contains
# hashicorp/null@3.2.4. When this workspace runs:
#
#   1. The Scalr agent reads .terraform.lock.hcl and finds null@3.2.4 in
#      the cache (cache lookup is by source/version, not hash).
#   2. `inject_lockfile_h1_checksums` cannot inject the real h1 hash
#      because the lockfile is missing the matching zh hash, so the
#      wrong h1 stays in the file.
#   3. tofu init then verifies the cached package against the locked h1,
#      sees the mismatch, and fails with
#      "Failed to resolve provider packages" → plan_init_failed.

terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.2.4"
    }
  }
}

resource "null_resource" "x" {}
