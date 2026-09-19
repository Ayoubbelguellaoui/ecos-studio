#!/usr/bin/env bash
set -euo pipefail

SCRIPT_FILE="$(dirname "${BASH_SOURCE[0]}")"
REPO_ROOT="$(cd "$SCRIPT_FILE/../.." && pwd)"
AGENT_DIR="$REPO_ROOT/ecos/agent"

cd "$AGENT_DIR"

uv run --locked --with pyinstaller==6.17 pyinstaller \
  --clean \
  --noconfirm \
  --onefile \
  --name ecos-agent \
  --distpath dist \
  --specpath build \
  --workpath build \
  --add-data "$PWD/knowledge:knowledge" \
  packaging/run_ecos_agent.py
