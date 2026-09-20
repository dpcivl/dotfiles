#!/usr/bin/env bash
# VS Code 설정/확장을 이 레포 기준으로 복원한다.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case "$(uname -s)" in
  Darwin) VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User" ;;
  Linux)  VSCODE_USER_DIR="$HOME/.config/Code/User" ;;
  *) echo "지원하지 않는 OS: $(uname -s)" >&2; exit 1 ;;
esac

mkdir -p "$VSCODE_USER_DIR"

for f in settings.json keybindings.json; do
  src="$REPO_DIR/vscode/$f"
  [ -f "$src" ] || continue
  dst="$VSCODE_USER_DIR/$f"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    mv "$dst" "$dst.bak.$(date +%Y%m%d%H%M%S)"
    echo "기존 $f 를 백업했습니다."
  fi
  ln -sfn "$src" "$dst"
  echo "링크: $dst -> $src"
done

if command -v code >/dev/null 2>&1; then
  while read -r ext; do
    [ -n "$ext" ] || continue
    code --install-extension "$ext" --force
  done < "$REPO_DIR/vscode/extensions.txt"
else
  echo "code CLI를 찾을 수 없어 확장 설치를 건너뜁니다." >&2
fi
