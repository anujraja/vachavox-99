#!/usr/bin/env bash
set -euo pipefail

OWNER="${GITHUB_OWNER:-{{GITHUB_OWNER}}}"
REPO="${GITHUB_REPOSITORY_NAME:-{{PROJECT_SLUG}}}"
BRANCH="${DEFAULT_BRANCH:-{{DEFAULT_BRANCH}}}"
CHECK_NAME="${REQUIRED_CHECK_NAME:-ci}"

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI is required." >&2
  exit 1
fi

if [ "$OWNER" = "{{GITHUB_OWNER}}" ] || [ "$REPO" = "{{PROJECT_SLUG}}" ] || [ "$BRANCH" = "{{DEFAULT_BRANCH}}" ]; then
  echo "Set GITHUB_OWNER, GITHUB_REPOSITORY_NAME, and DEFAULT_BRANCH, or run init-project.sh first." >&2
  exit 1
fi

gh api \
  --method PUT \
  "repos/$OWNER/$REPO/branches/$BRANCH/protection" \
  --field required_status_checks.strict=true \
  --field "required_status_checks.contexts[]=$CHECK_NAME" \
  --field enforce_admins=false \
  --field required_pull_request_reviews.required_approving_review_count=0 \
  --field restrictions=

echo "Requested branch protection for $OWNER/$REPO:$BRANCH requiring $CHECK_NAME."

