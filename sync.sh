#!/usr/bin/env bash
# 현재 설치된 확장 목록을 레포에 다시 기록한다.
set -euo pipefail
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
code --list-extensions > "$REPO_DIR/vscode/extensions.txt"
echo "vscode/extensions.txt 갱신 완료 ($(wc -l < "$REPO_DIR/vscode/extensions.txt" | tr -d ' ')개)"
