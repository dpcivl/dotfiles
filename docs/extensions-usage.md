# 설치된 확장 전체 가이드

`vscode/extensions.txt`에 기록된 27개 확장의 역할과 사용법. 설치 버전의 `package.json`에서 명령 이름과 기본 단축키를 확인해 작성했다.

- 단축키는 macOS 기준. `Cmd+Shift+P`(명령 팔레트)에서 아래 **명령 이름**을 그대로 검색하면 실행된다.
- "설정 예시"로 적은 `settings.json` 항목은 **문서에만 있고 아직 적용하지 않았다**.

## 한눈에 보기

| 분류 | 확장 | 한 줄 요약 |
|---|---|---|
| AI | Claude Code | VS Code 안의 Claude 대화·코드 수정 |
| 마크다운 | Markdown Preview Enhanced (MPE) | 고급 미리보기, mermaid, 코드 실행, 내보내기 |
| | Markdown All in One | 편집 단축키, 목차, 체크박스 |
| | markdownlint | 마크다운 스타일 검사·자동 교정 |
| | Foam | `[[위키링크]]` 노트, 백링크, 그래프 |
| | Mermaid (mermaidchart) | mermaid 다이어그램 편집·미리보기, 클라우드/AI 기능 |
| 진단 | Error Lens | 에러·경고를 줄 끝에 인라인 표시 |
| Python | Python / Pylance / Python Debugger / Python Environments | 언어 지원, 타입 분석, 디버깅, 가상환경 관리 |
| | Ruff | 린트 + 포맷 + import 정렬 |
| Jupyter | Jupyter / Keymap / Renderers / Cell Tags / Slide Show | 노트북 편집·실행과 부속 기능 |
| 원격 | Remote - SSH / SSH Edit / Remote Explorer | 서버 파일을 로컬처럼 편집 |
| Java | Java Pack 구성 7종 | 언어 지원, 디버그, 테스트, Maven, Gradle, 프로젝트 관리 |

---

## 1. AI

### Claude Code (`anthropic.claude-code`)

| 동작 | 방법 |
|---|---|
| 입력창 포커스 이동/해제 | `Cmd+Esc` |
| 새 탭으로 열기 | `Cmd+Shift+Esc` (`Claude Code: Open in New Tab`) |
| 새 대화 | `Cmd+N` (`Claude Code: New Conversation`) |
| 닫은 세션 다시 열기 | `Cmd+Shift+T` (`Claude Code: Reopen Closed Session`) |
| 현재 파일/선택 영역 참조 넣기 | `Alt+K` (`Claude Code: Insert @-Mention Reference`) |
| 집중 보기 전환 | `Ctrl+Alt+F` (`Claude Code: Toggle Focus view`) |
| 제안된 변경 수락/거절 | `Claude Code: Accept / Reject Proposed Changes`, 개별 hunk 단위도 가능 |
| 별도 창·사이드바·터미널로 열기 | `Claude Code: Open in New Window / Side Bar / Terminal` |
| 워크트리 생성 | `Claude Code: Create Worktree` |

`claudeCode.preferredLocation`은 현재 `panel`로 설정돼 있다(`vscode/settings.json`). 문제가 생기면 `Claude Code: Show Logs`.

---

## 2. 마크다운 · 노트

역할을 나누면 이렇다: **편집은 Markdown All in One, 검사는 markdownlint, 노트 연결은 Foam, 보기는 MPE**.

### Markdown Preview Enhanced (`shd101wyy.markdown-preview-enhanced`)

| 동작 | 방법 |
|---|---|
| 옆에 미리보기 | `Cmd+K V` |
| 미리보기 탭으로 열기 | `Cmd+Shift+V` |
| 미리보기 잠금(파일을 바꿔도 유지) | `Cmd+K Shift+L` |
| 편집기 ↔ 미리보기 위치 동기화 | `Ctrl+Shift+S` |
| 코드 청크 실행 / 전체 실행 | `Shift+Enter` / `Ctrl+Shift+Enter` |
| 이미지 삽입 도우미 | `Markdown Preview Enhanced: Image Helper` |
| 슬라이드/표/페이지 나눔 삽입 | `Insert New Slide / Insert Table / Insert Page Break` |
| 그래프 뷰 | `Markdown Preview Enhanced: Open Graph View` |
| CSS 커스터마이즈 | `Customize CSS (Global)` / `(Workspace)` |

자주 쓰는 문법:

````markdown
[TOC]

```mermaid
graph LR
  A[문서] --> B[청킹] --> C[임베딩]
```

@import "../src/example.py"

```python {cmd=true}
print("코드 청크: Shift+Enter로 실행하면 결과가 문서에 붙는다")
```
````

- 미리보기 우클릭 메뉴에서 HTML, PDF(Chrome Puppeteer), 이미지 등으로 내보낸다. PDF는 Chrome/Chromium이 필요하다(`markdown-preview-enhanced.chromePath`로 경로 지정).
- `enableScriptExecution`이 기본 `false`라서 `{cmd=true}` 코드 청크가 실행되지 않으면 이 설정부터 확인한다.
- `enableWikiLinkSyntax`가 기본 `true`라 미리보기에서 `[[위키링크]]`를 해석한다. Foam과 링크 규칙이 다르면 `wikiLinkTargetFileExtension`, `wikiLinkResolution`을 맞춘다.
- `Translate Current Preview`는 AI 번역 API 키가 필요해 외부 네트워크가 있어야 쓸 수 있다.
- 테마: `previewTheme`, `mermaidTheme`, `codeBlockTheme`.

### Markdown All in One (`yzhang.markdown-all-in-one`)

| 동작 | 방법 |
|---|---|
| 굵게 / 기울임 / 취소선 | `Cmd+B` / `Cmd+I` / `Alt+S` |
| 헤딩 레벨 올리기 / 내리기 | `Ctrl+Shift+]` / `Ctrl+Shift+[` |
| 체크박스 토글 | `Alt+C` (`Toggle TaskList`) |
| 수식 환경 토글 | `Cmd+M` |
| 코드 스팬 / 코드 블록 / 리스트 토글 | 명령 팔레트의 `Toggle code span / code block / list` |
| 목차 생성 / 갱신 | `Create Table of Contents` / `Update Table of Contents` (저장 시 자동 갱신) |
| 헤딩 번호 붙이기 / 제거 | `Add/Update section numbers` / `Remove section numbers` |
| HTML로 내보내기 | `Print current document to HTML` |
| 리스트 이어쓰기 | 리스트 줄에서 `Enter`, 빈 항목에서 한 번 더 `Enter`하면 종료 |
| 링크 만들기 | 텍스트 선택 후 URL 붙여넣기 |
| 표 정렬 | 표 안에서 문서 포맷 (`Shift+Option+F`) |

목차에서 특정 헤딩을 빼려면 끝에 `<!-- omit in toc -->`를 붙인다.

### markdownlint (`davidanson.vscode-markdownlint`)

| 명령 | 동작 |
|---|---|
| `markdownlint: Fix all supported violations in the document` | 자동 교정 가능한 항목 일괄 수정 |
| `markdownlint: Lint all Markdown files in the workspace` | 워크스페이스 전체 검사 |
| `markdownlint: Create or open the configuration file for the workspace` | `.markdownlint.json` 생성/열기 |
| `markdownlint: Toggle linting on/off (temporarily)` | 임시로 끄기 |

- 밑줄에 마우스를 올리면 규칙 번호(`MD022` 등)가 보이고 `Cmd+.`로 빠른 수정을 쓴다.
- 한국어 문서는 줄 길이 규칙이 거의 항상 걸리므로 `.markdownlint.json`에서 끈다.

  ```json
  { "MD013": false, "MD033": false, "MD041": false }
  ```

  MD013 줄 길이, MD033 인라인 HTML, MD041 첫 줄 H1 강제.
- 부분 예외: `<!-- markdownlint-disable MD033 -->` … `<!-- markdownlint-enable MD033 -->`
- 설정 예시(저장 시 자동 교정):

  ```json
  "editor.codeActionsOnSave": { "source.fixAll.markdownlint": "explicit" }
  ```

### Foam (`foam.foam-vscode`)

| 동작 | 방법 |
|---|---|
| 링크 걸기 | `[[노트이름]]` 입력 시 자동완성. `Cmd+클릭`으로 이동, 없는 노트는 클릭하면 생성 |
| 오늘의 데일리 노트 | `Alt+D` (`Foam: Open Today's Note`) |
| 특정 날짜 데일리 노트 | `Alt+H` (`Foam: Open Daily Note`) |
| 새 노트 / 템플릿으로 새 노트 | `Foam: Create New Note` / `Create New Note From Template` |
| 템플릿 만들기 | `Foam: Create New Template` (기본 폴더 `.foam/templates`) |
| 그래프 | `Foam: Show Graph` |
| 태그 검색·이름 변경 | `Foam: Search Tag` / `Rename Tag` |
| 위키링크 ↔ 마크다운 링크 변환 | `Foam: Convert Wikilink to Markdown Link` / `Convert Markdown Link to Wikilink` |
| 링크 없는 노트 찾기 | 사이드바 Orphans 패널 |
| 아직 없는 노트를 가리키는 링크 | 사이드바 Placeholders 패널 |
| 나를 참조하는 노트 | 사이드바 Connections 패널 (`Show Backlinks`) |
| 유사 노트 | `Foam: Show Similar Notes`, `Foam: Build Embeddings Index` |
| HTML 내보내기 | `Foam: Export to HTML page` |
| 캐시 문제 | `Foam: Clear Cache` → `Foam: Update Graph` |

- 데일리 노트 파일명은 기본 `isoDate`(예: `2026-09-20.md`), 새 노트 위치는 `foam.files.newNotePath`(기본 `root`).
- 임베딩 기반 기능(`Show Similar Notes`, `Build Embeddings Index`)이 외부 호출을 하는지는 확인하지 못했다. 폐쇄망에서 쓰기 전에 동작을 먼저 확인한다.
- 개발 폴더가 노트로 잡히지 않게 `foam.files.exclude` 기본값에 `.venv`, `node_modules`, `build` 등이 이미 들어 있다.

### Mermaid (`mermaidchart.vscode-mermaid-chart`)

Mermaid 팀의 공식 확장으로, 다이어그램 편집 외에 **Mermaid Chart 클라우드 계정과 AI 기능**이 붙어 있다.

| 동작 | 방법 |
|---|---|
| 새 다이어그램 파일 | `Mermaid: Create Diagram` |
| 미리보기 | `Mermaid: Preview Diagram` |
| 자동완성 강제 호출 | `Ctrl+Shift+K` |
| 문법 오류 자동 수정 | `Mermaid: Repair Diagram` (AI 기능으로 보이며 계정/네트워크 필요 여부는 확인하지 못했다) |
| 코드에서 다이어그램 생성 | `Mermaid: Generate Diagram from Code`, `Generate ER Diagram`, `Generate Docker Diagram`, `Generate Cloud Diagram` |
| 클라우드와 동기화 | `Mermaid: Sync Diagram` (기본 단축키가 `Cmd+S`에 걸려 있음) |
| 로그인 | `Mermaid: Login` |

- **저장(`Cmd+S`)에 동기화 단축키가 걸려 있다.** mermaid 파일에서만 동작하는지는 확인하지 못했다. 예상 밖으로 동기화되거나 로그인을 요구하면 이 키바인딩을 확인한다.
- 마크다운 안의 ` ```mermaid ` 블록은 이 확장 없이 MPE가 렌더한다. 로컬 문서만 쓴다면 MPE로 충분하고, 이 확장은 `.mmd` 파일 편집·자동완성과 AI 생성이 필요할 때 쓴다.
- 클라우드 계정·AI·GitHub 연동 기능은 모두 외부망이 필요하다. 폐쇄망에서는 로컬 미리보기와 자동완성만 쓸 수 있다고 보고 접근한다.

---

## 3. 진단

### Error Lens (`usernamehw.errorlens`)

설치만 하면 동작한다. Ruff, Pylance, markdownlint, Java 진단이 모두 줄 끝에 인라인으로 붙는다.

| 명령 | 동작 |
|---|---|
| `Error Lens: Toggle (Enable/Disable) Everything` | 전체 켜고 끄기 |
| `Toggle Errors / Warnings / Info / Hint` | 수준별 켜고 끄기 |
| `Error Lens: Copy Problem Message` | 메시지를 복사해서 Claude에게 그대로 붙여넣기 좋다 |
| `Error Lens: Find Linter Rule Definition` | 규칙 설명 검색 |
| `Error Lens: Disable line` | 해당 줄의 진단을 억제하는 주석 삽입 |
| `Error Lens: Exclude Problem` | 특정 메시지를 앞으로 숨기기 |
| `Error Lens: Toggle Workspace in Disabled List` | 워크스페이스별 끄기 |

설정 예시:

```json
"errorLens.enabledDiagnosticLevels": ["error", "warning"],
"errorLens.delay": 500
```

---

## 4. Python

### 구성 관계

`Python`(ms-python.python)이 뼈대이고 `Pylance`, `Python Debugger`, `Python Environments`를 의존 확장으로 함께 설치한다. **Pylance는 타입 분석·자동완성, Ruff는 린트·포맷**으로 역할이 다르니 둘 다 켜 둔다.

### Python (`ms-python.python`) + Python Environments

| 동작 | 방법 |
|---|---|
| 인터프리터 선택 | `Python: Select Interpreter` |
| 가상환경 만들기 | `Python: Create Environment` |
| 환경 관리 사이드바 | Python Environments 확장이 환경 목록·생성·패키지 관리를 통합 제공 |
| 선택 영역/현재 줄 실행 | `Shift+Enter` (Python 파일에서는 터미널 또는 REPL로 전송) |
| 테스트 실행 | 왼쪽 Testing(비커 아이콘) 패널. pytest는 `Python: Configure Tests`로 설정 |

### Pylance (`ms-python.vscode-pylance`)

자동완성, 정의로 이동, 타입 검사. 엄격도는 설정으로 조절한다.

```json
"python.analysis.typeCheckingMode": "basic"
```

값은 `off` / `basic` / `standard` / `strict`. 오탐이 많으면 `basic`, 타입을 강제하려면 `strict`. 동작이 이상하면 `Developer: Reload Window`, 진단이 필요하면 `Pylance: Start Logging`.

### Python Debugger (`ms-python.debugpy`)

- `F5` 또는 편집기 우상단 ▶ 옆 드롭다운 → `Python Debugger: Debug Python File`.
- 인자·환경변수·`cwd`가 필요하면 `.vscode/launch.json`을 만들고 `Python Debugger: Debug using launch.json`.
- 줄 번호 왼쪽 클릭으로 중단점, 중단점 우클릭으로 조건부 중단점.
- 로그는 `Python Debugger: Show Output`.

### Ruff (`charliermarsh.ruff`)

확장에 실행 파일이 들어 있어 별도 설치가 필요 없다.

| 명령 | 동작 |
|---|---|
| `Ruff: Format document` | 포맷 |
| `Ruff: Fix all auto-fixable problems` | 자동 수정 가능한 린트 일괄 수정 |
| `Ruff: Format imports` | import 정렬 |
| `Ruff: Restart Server` / `Show client logs` | 문제 해결 |

설정 예시(저장 시 자동 적용):

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

규칙은 프로젝트 `pyproject.toml`에 둔다.

```toml
[tool.ruff]
line-length = 100

[tool.ruff.lint]
select = ["E", "F", "I", "B", "UP"]
```

한 줄 예외는 `# noqa: E501`. 터미널에서는 `ruff check .`, `ruff format .`. 노트북 셀에도 같은 규칙이 적용된다.

---

## 5. Jupyter

`Jupyter`(ms-toolsai.jupyter)가 본체이고 나머지 4개는 의존 확장이다.

### Jupyter

| 동작 | 방법 |
|---|---|
| 노트북 열기 | `.ipynb` 파일을 열면 자동으로 노트북 편집기 |
| 커널 선택 | 우상단 `Select Kernel` (Python 인터프리터 = 커널) |
| 셀 실행 후 다음으로 | `Shift+Enter` |
| 셀 실행(이동 안 함) | `Ctrl+Enter` |
| 셀 실행 후 아래에 새 셀 | `Alt+Enter` |
| 셀 위/아래 추가 | `Ctrl+; A` / `Ctrl+; B` |
| 셀 삭제 | `Ctrl+; X` |
| 셀 위/아래로 이동 | `Ctrl+; U` 등 (`Ctrl+;` 뒤에 키) |

일반 `.py` 파일에서도 `# %%`로 셀을 나누면 코드 셀이 되고, 셀 위 `Run Cell`이나 `Shift+Enter`로 Interactive Window에서 실행한다. 노트북 diff와 git이 편해서 실험용은 이쪽이 낫다.

### Jupyter Keymap

클래식 Jupyter 방식의 **명령 모드 단축키**를 추가한다. 셀을 선택한 상태(`Esc`로 편집 모드에서 나옴)에서 다음 키를 쓴다.

| 키 | 동작 |
|---|---|
| `J` / `K` | 아래/위 셀로 이동 |
| `A` / `B` | 위/아래에 코드 셀 삽입 |
| `D D` | 셀 삭제 |
| `C` / `X` / `V` | 복사/잘라내기/붙여넣기 |
| `Z` | 실행 취소 |
| `S` | 저장 |
| `F` | 찾기 |
| `O` | 출력 접기/펼치기 |
| `L` / `Shift+L` | 현재 셀 / 전체 줄번호 토글 |
| `Ctrl+Shift+-` | 커서 위치에서 셀 나누기 (편집 모드) |

### Jupyter Notebook Renderers

plotly, vega, gif, png, svg 등 출력 렌더러. 설정할 것은 없고, plotly/altair 결과가 셀에 보이지 않을 때 이 확장이 설치돼 있는지 확인한다.

### Jupyter Cell Tags

- `Add Cell Tag` / `Remove Cell Tag` / `Edit Cell Tags (JSON)`
- `Mark Cell as Parameters`: papermill 같은 도구가 파라미터 셀로 인식하는 `parameters` 태그를 붙인다.
- 태그는 `nbconvert`로 특정 셀을 숨길 때도 쓴다.

### Jupyter Slide Show

- `Switch Slide Type`으로 셀을 slide / subslide / fragment / skip / notes로 지정한다.
- `nbconvert --to slides` 등으로 reveal.js 슬라이드를 만들 때 쓰는 메타데이터다. 슬라이드는 MPE로도 만들 수 있으니 쓸 일이 적으면 무시해도 된다.

---

## 6. 원격

`Remote - SSH`가 본체이고 `SSH Edit`(ssh config 편집 지원)과 `Remote Explorer`(사이드바에 호스트 목록 표시)는 의존 확장이다. 따로 조작할 것은 없다.

1. `~/.ssh/config`에 호스트 등록

   ```sshconfig
   Host gpu-dev
     HostName 10.0.0.12
     User d
     IdentityFile ~/.ssh/id_ed25519
     # 점프 호스트를 거쳐야 하면
     # ProxyJump bastion
   ```

2. `Remote-SSH: Connect to Host...` → `gpu-dev`. 창 왼쪽 아래에 `SSH: gpu-dev`가 표시된다.
3. `Open Folder`로 서버의 프로젝트 폴더를 연다. 터미널·디버거·확장 실행은 모두 서버에서 이뤄진다.
4. 끊기: 왼쪽 아래 표시 클릭 → `Close Remote Connection`.

폐쇄망 주의점:

- **확장은 원격에 따로 설치**된다. 접속한 창의 확장 목록에서 `Install in SSH: gpu-dev`를 누르거나 자동 설치 목록을 지정한다.

  ```json
  "remote.SSH.defaultExtensions": ["anthropic.claude-code", "charliermarsh.ruff", "ms-python.python"]
  ```

- 서버가 인터넷에 못 나가면 VS Code Server 다운로드가 실패한다. 로컬에서 받아 전송하게 바꾼다.

  ```json
  "remote.SSH.localServerDownload": "always"
  ```

- 원격에서 확장 설치도 마켓플레이스 접근이 필요할 수 있다. 이 경우 `.vsix`를 반입해 설치한다(README 참고).

---

## 7. Java

Java 확장은 `Extension Pack for Java`(`vscjava.vscode-java-pack`)가 아래 6개를 묶어 설치한다. 별도로 조작할 것은 팩 자체에는 없다(`Shift+F1`: 시작 화면).

| 확장 | 역할 |
|---|---|
| Language Support for Java (Red Hat) | 자동완성, 오류 표시, 리팩터링, 포맷 — 나머지의 기반 |
| Debugger for Java | 중단점 디버깅 |
| Test Runner for Java | JUnit / TestNG 실행·디버그 |
| Maven for Java | pom.xml 프로젝트 관리, goal 실행 |
| Gradle for Java | Gradle 태스크 실행, 빌드 파일 편집 지원 |
| Project Manager for Java | 프로젝트/패키지/의존성 트리, 파일 생성 |

| 동작 | 방법 |
|---|---|
| 새 프로젝트 | `Java: Create Java Project` |
| JDK 설정 확인 | `Java: Configure Java Runtime` |
| 프로젝트 설정 갱신(빌드 파일 수정 후) | `Shift+Alt+U` (`Java: Update Project`) |
| 워크스페이스 컴파일 | `Shift+Alt+B` |
| 코드 정리 | `Ctrl+Shift+Alt+S` (`Java: Cleanup`) |
| 확장 아웃라인 | `Ctrl+O` |
| 실행/디버그 | `main` 메서드 위의 `Run | Debug` 링크, 또는 `F5` |
| 테스트 | 왼쪽 Testing 패널에서 클래스·메서드 단위 실행 |
| Maven / Gradle | 탐색기 하단 `MAVEN` 패널, 사이드바 Gradle(코끼리) 아이콘에서 goal·task 실행 |
| 파일 이름 변경/삭제 | 탐색기 트리에서 `Enter` / `Cmd+Backspace` |
| 경로 복사 | `Cmd+Alt+C` (절대), `Cmd+Shift+Alt+C` (상대) |
| 언어 서버가 꼬였을 때 | `Java: Clean Java Language Server Workspace` |

Java를 안 쓰는 프로젝트에서는 언어 서버가 뜨지 않으므로 신경 쓸 필요는 없다.

---

## 8. 키 충돌·중복 주의

| 상황 | 내용 |
|---|---|
| `Cmd+Shift+V` | MPE는 미리보기 열기, Java는 클립보드 붙여넣기에 사용한다. 파일 종류에 따라 달라지니 마크다운에서는 MPE 미리보기가 열린다. |
| `Shift+Enter` | Python(선택 실행), Jupyter(셀 실행), MPE(코드 청크 실행), Markdown All in One(목록 처리)이 각각 쓴다. 편집 중인 파일/문맥에 따라 동작이 다르다. |
| `Cmd+S` | Mermaid 확장이 동기화 명령을 걸어 두었다. 저장 동작이 이상하면 이 바인딩을 확인한다. |
| 위키링크 | Foam과 MPE가 모두 `[[ ]]`를 다룬다. 편집·이동은 Foam, 미리보기 렌더는 MPE가 담당한다. |
| Python 진단 | Pylance(타입)와 Ruff(스타일)가 모두 진단을 낸다. Error Lens가 둘을 함께 보여 준다. |

## 9. 폐쇄망에서 쓸 때 요약

| 확장 | 외부망 필요 여부 |
|---|---|
| Ruff, Error Lens, markdownlint, Markdown All in One, Foam(기본 기능), MPE(미리보기·mermaid), Jupyter, Java 팩, Python | 설치 후에는 로컬에서 동작 |
| Remote - SSH | 원격 서버에 VS Code Server 설치 필요(`localServerDownload`로 우회) |
| Claude Code | 인증·API 접근 필요 |
| Mermaid(mermaidchart) | 로그인·AI·GitHub 동기화는 외부망 필요, 로컬 편집은 가능한 것으로 보임 |
| MPE AI 번역 | API 키·외부망 필요 |
| Foam 임베딩 기능 | 확인하지 못함 |
| 확장 설치 자체 | 마켓플레이스 대신 `.vsix` 반입 (`extensions.txt` 기준) |
