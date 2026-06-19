#!/usr/bin/env bash
set -euo pipefail

# VachaVox 99 control-packet bootstrap.
# Run only from the extracted packet root, before a product repo exists.
# It seeds this folder from anujraja/agent-project-template while preserving
# this packet's README, AGENTS, 00-CODEX-GOAL, and docs/ specifications.

OWNER="${GITHUB_OWNER:-anujraja}"
REPO="${REPO_NAME:-vachavox-99}"
TEMPLATE_URL="${TEMPLATE_URL:-https://github.com/anujraja/agent-project-template.git}"

if [[ -d ".git" ]]; then
  echo "This folder is already a Git repository. Bootstrap stopped safely."
  exit 0
fi

if ! command -v git >/dev/null 2>&1; then
  echo "git is required."
  exit 1
fi

TMP="$(mktemp -d)"
cleanup() { rm -rf "$TMP"; }
trap cleanup EXIT

echo "Cloning template into temporary staging..."
git clone --depth 1 "$TEMPLATE_URL" "$TMP/template"

echo "Copying template structure while preserving VachaVox 99 control files..."
# Do not overwrite the packet's root guidance and detailed specs.
rsync -a \
  --exclude ".git" \
  --exclude "README.md" \
  --exclude "AGENTS.md" \
  --exclude "docs" \
  "$TMP/template/" "./"

# Bring over template docs only when the packet has not already supplied them.
mkdir -p docs
for item in "$TMP/template/docs/"*; do
  [[ -e "$item" ]] || continue
  base="$(basename "$item")"
  if [[ ! -e "docs/$base" ]]; then
    cp -R "$item" "docs/$base"
  fi
done

git init -b main
git add -A
git commit -m "chore: bootstrap VachaVox 99 from project template"

if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
  if gh repo view "$OWNER/$REPO" >/dev/null 2>&1; then
    echo "GitHub repo $OWNER/$REPO already exists; adding it as origin."
    git remote add origin "git@github.com:$OWNER/$REPO.git" 2>/dev/null || \
      git remote set-url origin "git@github.com:$OWNER/$REPO.git"
  else
    echo "Creating public GitHub repo $OWNER/$REPO..."
    gh repo create "$OWNER/$REPO" --public --source=. --remote=origin --push
  fi
else
  echo
  echo "Local repository is ready, but GitHub CLI auth is unavailable."
  echo "Human task: authenticate 'gh auth login', then run:"
  echo "  gh repo create $OWNER/$REPO --public --source=. --remote=origin --push"
fi

echo "Bootstrap complete. Next: follow docs/10-EXECUTION-LOOP.md."
