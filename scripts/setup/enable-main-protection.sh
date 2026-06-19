#!/usr/bin/env bash
set -euo pipefail

OWNER="${GITHUB_OWNER:-anujraja}"
REPO="${GITHUB_REPOSITORY_NAME:-vachavox-99}"
BRANCH="${DEFAULT_BRANCH:-main}"
CHECK_NAME="${REQUIRED_CHECK_NAME:-ci}"

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI is required." >&2
  exit 1
fi

if [ -z "$OWNER" ] || [ -z "$REPO" ] || [ -z "$BRANCH" ]; then
  echo "Set GITHUB_OWNER, GITHUB_REPOSITORY_NAME, and DEFAULT_BRANCH." >&2
  exit 1
fi

payload="$(mktemp)"
cleanup() { rm -f "$payload"; }
trap cleanup EXIT

cat > "$payload" <<JSON
{
  "required_status_checks": {
    "strict": true,
    "contexts": ["$CHECK_NAME"]
  },
  "enforce_admins": false,
  "required_pull_request_reviews": {
    "required_approving_review_count": 0
  },
  "restrictions": null
}
JSON

gh api \
  --method PUT \
  "repos/$OWNER/$REPO/branches/$BRANCH/protection" \
  --input "$payload"

echo "Requested branch protection for $OWNER/$REPO:$BRANCH requiring $CHECK_NAME."
