# 추천 확장

AX / RAG / 폐쇄망 코드 어시스턴트 개발 + VS Code 단일 IDE 워크플로 기준.
현재 설치본(Claude Code, MPE, Foam, Mermaid, Python, Jupyter, Java)을 전제로 겹치지 않는 것만 골랐다.

## 1순위 — 지금 바로

| 확장 | ID | 이유 |
|---|---|---|
| Markdown All in One | `yzhang.markdown-all-in-one` | 목차 자동 생성/갱신, 리스트 이어쓰기, 표 정렬, 단축키. Foam은 링크 그래프 담당이라 편집 편의는 비어 있다. |
| markdownlint | `davidanson.vscode-markdownlint` | LLM이 뱉는 마크다운은 헤딩 레벨·빈 줄이 제각각이다. 저장 시 자동 교정으로 문서 포맷을 강제한다. |
| Error Lens | `usernamehw.errorlens` | 진단을 해당 줄에 인라인 표시. AI가 생성한 코드를 훑을 때 문제 위치를 즉시 잡는다. |
| Ruff | `charliermarsh.ruff` | 린트 + 포맷 + import 정렬을 하나로. flake8/black/isort 조합보다 빠르고 설정이 단순하다. |
| Remote - SSH | `ms-vscode-remote.remote-ssh` | 내부망 GPU/개발 서버에 붙어 로컬처럼 편집. 폐쇄망 작업이면 사실상 필수. |

## 2순위 — RAG / 데이터 다룰 때

| 확장 | ID | 이유 |
|---|---|---|
| Rainbow CSV | `mechatroner.rainbow-csv` | 평가셋·청크 덤프 CSV/TSV를 컬럼별 색으로 구분하고 RBQL로 바로 쿼리. |
| SQLite Viewer | `qwtel.sqlite-viewer` | Chroma 등 SQLite 기반 벡터 스토어와 로컬 캐시 DB를 클릭으로 확인. |
| YAML | `redhat.vscode-yaml` | 프롬프트·파이프라인·k8s 매니페스트의 스키마 검증과 자동완성. |
| Even Better TOML | `tamasfe.even-better-toml` | `pyproject.toml`, `ruff.toml` 편집. |
| REST Client | `humao.rest-client` | `.http` 파일로 임베딩/LLM 엔드포인트를 호출하고 그 파일을 그대로 git에 커밋. Postman과 달리 외부 계정·동기화가 필요 없어 폐쇄망에 맞는다. |
| Dev Containers | `ms-vscode-remote.remote-containers` | 반입한 베이스 이미지 위에서 환경을 고정. 재현 가능한 폐쇄망 개발 환경. |

## 3순위 — 문서와 코드 사이

| 확장 | ID | 이유 |
|---|---|---|
| Markdown Preview Mermaid Support | `bierner.markdown-mermaid` | VS Code 기본 미리보기에서도 mermaid 렌더. MPE를 띄우지 않고 빠르게 확인할 때. |
| GitLens | `eamodio.gitlens` | 줄 단위 blame과 히스토리 탐색. 어시스턴트가 고친 코드의 변경 경위를 추적하기 좋다. |
| Todo Tree | `gruntfuggly.todo-tree` | 코드와 노트에 흩뿌린 TODO/FIXME를 트리로 모아 본다. Foam 노트도 같이 잡힌다. |
| Code Spell Checker | `streetsidesoftware.code-spell-checker` | 식별자·문서 오타. 영문 문서를 쓸 일이 많으면 값어치를 한다. |
| EditorConfig | `editorconfig.editorconfig` | 팀/레포마다 다른 들여쓰기·개행을 자동 적용. |
| Mypy Type Checker | `ms-python.mypy-type-checker` | Pylance의 타입 추론과 별개로 CI와 같은 기준으로 검사. |

## 넣지 않은 것

- **Markdown Memo / Dendron** — Foam과 위키링크 처리가 겹쳐 충돌한다.
- **Thunder Client** — REST Client와 역할이 같은데 계정·클라우드 동기화가 얽혀 폐쇄망에 불리하다.
- **Prettier** — 마크다운·JSON은 markdownlint와 내장 포맷터로 충분하고, Python은 Ruff가 맡는다.
- **GitHub Copilot 계열** — Claude Code와 자동완성·인라인 채팅 트리거가 겹친다.
