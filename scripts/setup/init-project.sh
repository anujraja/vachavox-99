#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  bash scripts/setup/init-project.sh \
    --name "My Project" \
    --slug my-project \
    --owner "Anuj Raja" \
    --github-owner anujraja \
    --domain example.com \
    --stack "TypeScript, React, Vite" \
    [--install-command "npm install"] \
    [--dev-command "npm run dev"] \
    [--typecheck-command "npm run typecheck"] \
    [--lint-command "npm run lint"] \
    [--test-command "npm test"] \
    [--build-command "npm run build"] \
    [--deploy-command "N/A"] \
    [--default-branch main]

This replaces common {{PLACEHOLDER}} values across the repo. Leave unknown
commands as N/A and update them when the stack is chosen.
USAGE
}

PROJECT_NAME=""
PROJECT_SLUG=""
OWNER_NAME=""
GITHUB_OWNER=""
DOMAIN=""
STACK=""
DEFAULT_BRANCH="main"
INSTALL_COMMAND="N/A"
DEV_COMMAND="N/A"
TYPECHECK_COMMAND="N/A"
LINT_COMMAND="N/A"
TEST_COMMAND="N/A"
BUILD_COMMAND="N/A"
DEPLOY_COMMAND="N/A"
YEAR="$(date +%Y)"

while [ "$#" -gt 0 ]; do
  case "$1" in
    --name) PROJECT_NAME="${2:-}"; shift 2 ;;
    --slug) PROJECT_SLUG="${2:-}"; shift 2 ;;
    --owner) OWNER_NAME="${2:-}"; shift 2 ;;
    --github-owner) GITHUB_OWNER="${2:-}"; shift 2 ;;
    --domain) DOMAIN="${2:-}"; shift 2 ;;
    --stack) STACK="${2:-}"; shift 2 ;;
    --default-branch) DEFAULT_BRANCH="${2:-}"; shift 2 ;;
    --install-command) INSTALL_COMMAND="${2:-}"; shift 2 ;;
    --dev-command) DEV_COMMAND="${2:-}"; shift 2 ;;
    --typecheck-command) TYPECHECK_COMMAND="${2:-}"; shift 2 ;;
    --lint-command) LINT_COMMAND="${2:-}"; shift 2 ;;
    --test-command) TEST_COMMAND="${2:-}"; shift 2 ;;
    --build-command) BUILD_COMMAND="${2:-}"; shift 2 ;;
    --deploy-command) DEPLOY_COMMAND="${2:-}"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage; exit 1 ;;
  esac
done

if [ -z "$PROJECT_NAME" ] || [ -z "$PROJECT_SLUG" ] || [ -z "$OWNER_NAME" ] || [ -z "$GITHUB_OWNER" ] || [ -z "$DOMAIN" ] || [ -z "$STACK" ]; then
  echo "Missing required argument." >&2
  usage
  exit 1
fi

replace_in_file() {
  file="$1"
  tmp="${file}.tmp"
  esc_project_name="$(printf '%s' "$PROJECT_NAME" | sed 's/[\/&]/\\&/g')"
  esc_project_slug="$(printf '%s' "$PROJECT_SLUG" | sed 's/[\/&]/\\&/g')"
  esc_owner_name="$(printf '%s' "$OWNER_NAME" | sed 's/[\/&]/\\&/g')"
  esc_github_owner="$(printf '%s' "$GITHUB_OWNER" | sed 's/[\/&]/\\&/g')"
  esc_domain="$(printf '%s' "$DOMAIN" | sed 's/[\/&]/\\&/g')"
  esc_stack="$(printf '%s' "$STACK" | sed 's/[\/&]/\\&/g')"
  esc_default_branch="$(printf '%s' "$DEFAULT_BRANCH" | sed 's/[\/&]/\\&/g')"
  esc_install_command="$(printf '%s' "$INSTALL_COMMAND" | sed 's/[\/&]/\\&/g')"
  esc_dev_command="$(printf '%s' "$DEV_COMMAND" | sed 's/[\/&]/\\&/g')"
  esc_typecheck_command="$(printf '%s' "$TYPECHECK_COMMAND" | sed 's/[\/&]/\\&/g')"
  esc_lint_command="$(printf '%s' "$LINT_COMMAND" | sed 's/[\/&]/\\&/g')"
  esc_test_command="$(printf '%s' "$TEST_COMMAND" | sed 's/[\/&]/\\&/g')"
  esc_build_command="$(printf '%s' "$BUILD_COMMAND" | sed 's/[\/&]/\\&/g')"
  esc_deploy_command="$(printf '%s' "$DEPLOY_COMMAND" | sed 's/[\/&]/\\&/g')"
  sed \
    -e "s/{{PROJECT_NAME}}/${esc_project_name}/g" \
    -e "s/{{PROJECT_SLUG}}/${esc_project_slug}/g" \
    -e "s/{{OWNER_NAME}}/${esc_owner_name}/g" \
    -e "s/{{GITHUB_OWNER}}/${esc_github_owner}/g" \
    -e "s/{{DOMAIN}}/${esc_domain}/g" \
    -e "s/{{STACK}}/${esc_stack}/g" \
    -e "s/{{DEFAULT_BRANCH}}/${esc_default_branch}/g" \
    -e "s/{{INSTALL_COMMAND}}/${esc_install_command}/g" \
    -e "s/{{DEV_COMMAND}}/${esc_dev_command}/g" \
    -e "s/{{TYPECHECK_COMMAND}}/${esc_typecheck_command}/g" \
    -e "s/{{LINT_COMMAND}}/${esc_lint_command}/g" \
    -e "s/{{TEST_COMMAND}}/${esc_test_command}/g" \
    -e "s/{{BUILD_COMMAND}}/${esc_build_command}/g" \
    -e "s/{{DEPLOY_COMMAND}}/${esc_deploy_command}/g" \
    -e "s/{{YEAR}}/${YEAR}/g" \
    "$file" > "$tmp"
  mv "$tmp" "$file"
}

while IFS= read -r -d '' file; do
  case "$file" in
    ./.git/*) continue ;;
  esac
  replace_in_file "$file"
done < <(find . -type f \
  \( -name '*.md' -o -name '*.yml' -o -name '*.yaml' -o -name '*.sh' -o -name '.env.example' -o -name 'CODEOWNERS' -o -name 'LICENSE' \) \
  -print0)

echo "Personalized common placeholders for $PROJECT_NAME."
echo "Run: rg '{{[A-Z0-9_]+}}' to find remaining project-specific placeholders."
