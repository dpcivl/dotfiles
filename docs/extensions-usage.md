# 확장 사용법

설치한 1순위 확장 5개의 실사용 가이드. 단축키는 macOS 기준이고, 명령은 `Cmd+Shift+P`(명령 팔레트)에서 이름으로 검색해 실행한다.

## Markdown All in One

마크다운 **편집**을 편하게 해 주는 확장. 미리보기는 Markdown Preview Enhanced를 그대로 쓰면 된다.

| 하고 싶은 것 | 방법 |
|---|---|
| 목차 삽입 | 명령 `Markdown All in One: Create Table of Contents`. 이후 저장할 때마다 자동 갱신된다 |
| 굵게 / 기울임 | 텍스트 선택 후 `Cmd+B` / `Cmd+I` |
| 헤딩 레벨 올리기·내리기 | `Cmd+Shift+]` / `Cmd+Shift+[` |
| 체크박스 토글 | `- [ ]` 줄에서 `Alt+C` |
| 리스트 이어쓰기 | 리스트 줄에서 `Enter`. 빈 항목에서 다시 `Enter`하면 리스트 종료 |
| 표 정렬 | 표 안에서 문서 포맷(`Shift+Option+F`). 열 너비가 맞춰진다 |
| 링크 붙여넣기 | 텍스트 선택 후 URL을 붙여넣으면 `[텍스트](URL)`로 바뀐다 |

목차에서 특정 헤딩을 빼려면 그 헤딩 끝에 `<!-- omit in toc -->`를 붙인다.

## markdownlint

마크다운 문법·스타일 위반에 노란 밑줄을 그어 준다. LLM이 만든 문서를 정리할 때 유용하다.

- 밑줄에 마우스를 올리면 `MD022` 같은 규칙 번호와 설명이 나온다.
- `Cmd+.`(빠른 수정)으로 자동 교정 가능한 건 바로 고친다.
- 문서 전체는 명령 `markdownlint: Fix all supported markdownlint violations`.
- 저장할 때 자동으로 고치려면 `settings.json`에 추가:

  ```json
  "editor.codeActionsOnSave": { "source.fixAll.markdownlint": "explicit" }
  ```

- 규칙이 거슬리면 프로젝트 루트에 `.markdownlint.json`을 두고 끈다.

  ```json
  { "MD013": false, "MD033": false, "MD041": false }
  ```

  MD013은 줄 길이, MD033은 인라인 HTML, MD041은 첫 줄 H1 강제 규칙이다. 한국어 문서는 MD013이 거의 항상 걸리므로 꺼 두는 편이 낫다.
- 특정 부분만 예외로 두려면 `<!-- markdownlint-disable MD033 -->` … `<!-- markdownlint-enable MD033 -->`.

## Error Lens

설치만 하면 끝이다. 문제 패널을 열지 않아도 에러·경고 메시지가 **해당 줄 끝에 바로** 붙어 보인다.

- 켜고 끄기: 명령 `Error Lens: Toggle`
- 너무 시끄러우면 `settings.json`에서 표시할 수준을 제한한다.

  ```json
  "errorLens.enabledDiagnosticLevels": ["error", "warning"]
  ```

- 타이핑 중에 깜빡이는 게 싫으면 `"errorLens.delay": 500`(ms).
- Ruff, Pylance, markdownlint의 진단이 전부 같은 방식으로 보이므로, 모든 확장의 결과를 한 화면에서 훑을 수 있다.

## Ruff

Python 린트 + 포맷 + import 정렬을 한 번에 처리한다. 별도 설치 없이 확장에 실행 파일이 들어 있다.

**저장 시 자동 포맷·정리** — `settings.json`에 추가:

```json
"[python]": {
  "editor.defaultFormatter": "charliermarsh.ruff",
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.fixAll.ruff": "explicit",
    "source.organizeImports.ruff": "explicit"
  }
}
```

**규칙 설정** — 프로젝트 `pyproject.toml`에 둔다.

```toml
[tool.ruff]
line-length = 100

[tool.ruff.lint]
select = ["E", "F", "I", "B", "UP"]   # 기본 오류, pyflakes, import 정렬, bugbear, pyupgrade
```

- 빠른 수정: 밑줄에서 `Cmd+.`
- 한 줄만 예외 처리: `# noqa: E501`
- Jupyter 노트북 셀에도 같은 규칙이 적용된다.
- 터미널에서도 같은 기준으로 돌릴 수 있다: `ruff check .`, `ruff format .`

## Remote - SSH

내부망 서버에 접속해 **서버의 파일을 로컬처럼** 편집하고, 터미널·디버거도 서버에서 돌린다.

1. `~/.ssh/config`에 호스트를 등록한다.

   ```sshconfig
   Host gpu-dev
     HostName 10.0.0.12
     User d
     IdentityFile ~/.ssh/id_ed25519
     # 점프 호스트를 거쳐야 하면
     # ProxyJump bastion
   ```

2. 명령 `Remote-SSH: Connect to Host...` → `gpu-dev` 선택. 새 창이 열리고 왼쪽 아래에 `SSH: gpu-dev`가 표시된다.
3. `Open Folder`로 서버의 프로젝트 폴더를 연다. 이후 터미널은 서버 셸이다.
4. 끊을 때는 왼쪽 아래 표시를 눌러 `Close Remote Connection`.

주의할 점:

- **확장은 원격에도 따로 설치**된다. 접속한 창의 확장 목록에서 `Install in SSH: gpu-dev`를 눌러야 Python/Ruff/Claude Code가 서버에서 동작한다. 자동으로 깔고 싶으면:

  ```json
  "remote.SSH.defaultExtensions": ["anthropic.claude-code", "charliermarsh.ruff", "ms-python.python"]
  ```

- **서버가 인터넷에 못 나가는 경우**: VS Code Server를 서버가 직접 내려받는 게 기본이라 실패한다. 로컬에서 받아 전송하도록 바꾼다.

  ```json
  "remote.SSH.localServerDownload": "always"
  ```

  그래도 원격에서의 확장 설치는 마켓플레이스 접근이 필요할 수 있으니, 폐쇄망이면 `.vsix`를 반입해 설치하는 방법을 병행한다(README 참고).
- `remote-ssh-edit`, `remote-explorer`는 Remote - SSH의 의존 확장이라 따로 만질 것이 없다. `remote-explorer`는 왼쪽 사이드바에서 등록된 호스트 목록을 보여 준다.

## 이미 쓰고 있는 확장 — 기본 동선만

- **Foam**: `[[노트이름]]`으로 링크하고 `Cmd+클릭`으로 이동한다. 없는 노트는 링크를 클릭하면 생성된다. 명령 `Foam: Show Graph`로 연결 그래프, 사이드바 Backlinks 패널로 나를 참조하는 노트를 본다. `Foam: Open Daily Note`로 오늘 노트를 연다.
- **Markdown Preview Enhanced**: 명령 `Markdown Preview Enhanced: Open Preview to the Side`. 코드 블록에 ` ```mermaid `를 쓰면 다이어그램이 렌더된다. `@import "파일경로"`로 다른 파일 내용을 문서에 끼워 넣을 수 있다.
