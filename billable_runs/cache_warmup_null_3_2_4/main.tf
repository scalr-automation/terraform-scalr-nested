# Warm-up template for the poisoned-lockfile e2e test.
#
# A successful run on this template causes the Scalr agent to install
# hashicorp/null@3.2.4 into its Provider Cache (see
# tacoagent/app/terraform/service/provider_cache.py). The cache entry is
# keyed by source/version/platform with no hash check (see
# `is_provider_installed`), so subsequent runs on any workspace that pins
# the same provider will reuse it from the cache.
#
# Pair with billable_runs/plan_init_failed_resolve_provider_packages/.

terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.2.4"
    }
  }
}

resource "null_resource" "warmup" {}
