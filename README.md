# dotfiles

VS Code 하나로 코드 편집 · 마크다운 노트 · LLM 협업을 전부 처리하기 위한 설정 모음.

## 구성

```
vscode/settings.json    사용자 설정 (심볼릭 링크로 연결)
vscode/extensions.txt   설치된 확장 목록
install.sh              설정 링크 + 확장 일괄 설치
sync.sh                 현재 확장 목록을 레포에 다시 기록
```

## 사용

```bash
git clone https://github.com/dpcivl/dotfiles.git ~/dev/dotfiles
~/dev/dotfiles/install.sh
```

확장을 새로 깔거나 지운 뒤에는:

```bash
./sync.sh && git commit -am "chore: sync extensions"
```

## 폐쇄망에서 쓸 때

마켓플레이스에 접근할 수 없는 환경에서는 `extensions.txt`의 ID를 기준으로 외부망에서
`.vsix`를 미리 받아 반입한 뒤 설치한다.

```bash
code --install-extension ./vsix/foam.foam-vscode-0.44.6.vsix
```

`.vsix` 파일 자체는 `.gitignore`에 걸려 있으므로 커밋되지 않는다.

## 추천 확장

- 목록과 선정 이유: [docs/extensions-recommended.md](docs/extensions-recommended.md)
- 설치한 확장 사용법: [docs/extensions-usage.md](docs/extensions-usage.md)
