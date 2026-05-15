# tutor-skill (한국어)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Gemini CLI](https://img.shields.io/badge/Gemini_CLI-skill-orange)](https://github.com/google/gemini-cli)

어떤 지식 소스든 **Notion StudyVault**로 변환하고, 이를 바탕으로 퀴즈를 진행하여 학습 내용을 완벽히 이해하도록 돕는 두 개의 [Gemini CLI](https://github.com/google/gemini-cli) 스킬입니다.

[English README](./README.md)

## 작동 원리

```
  문서 / 코드                           Notion                     퀴즈 세션
 ┌──────────────────┐           ┌──────────────────┐          ┌──────────────────┐
 │  PDF, MD, HTML,  │  /tutor   │   StudyVault/    │  /tutor  │  라운드당 4문제,  │
 │  EPUB, 소스 코드 │──setup──▶ │   구조화된       │────────▶ │  채점, 개념별     │
 │  프로젝트        │           │   연결된 노트    │          │  진도 추적        │
 └──────────────────┘           │   + MOC          │          └────────┬─────────┘
                                └──────────────────┘                   │
                                         ▲                             │
                                         └─────── 학습 진도 업데이트 ──┘
```

## 스킬 개요

| 스킬 | 명령어 | 용도 | 입력 | 출력 |
|-------|---------|---------|-------|--------|
| **tutor-setup** | `/tutor-setup` | StudyVault 생성 | 문서 또는 소스 코드 | 노트와 연습 문제가 포함된 Notion 데이터베이스 |
| **tutor** | `/tutor` | 대화형 퀴즈 튜터 | Notion StudyVault | 개념 수준의 진도 추적이 포함된 퀴즈 세션 |

## 🚀 빠른 시작 (한 줄 설치)

사용 중인 CLI에 맞는 명령어를 입력하세요:

**Claude Code 사용자:**
```bash
npx skills add YoonJae00/tutor-skills
```

**Gemini CLI 사용자:**
```bash
gemini skills install https://github.com/YoonJae00/tutor-skills --scope user --consent
```

> [!tip]
> 이 명령어를 사용하면 저장소를 직접 클론할 필요 없이 자동으로 스킬이 등록됩니다.

---

## 🛠️ 수동 설치 (개발자용)

스킬을 직접 수정하거나 기여하고 싶은 경우:

```bash
git clone https://github.com/YoonJae00/tutor-skills.git
cd tutor-skills
./install-gemini.ps1  # Windows용 설치 스크립트
```

### 1단계: StudyVault 생성

```bash
cd ~/study-materials/          # 또는 소스 코드 프로젝트 디렉토리
gemini
> /tutor-setup
```

### 2단계: 퀴즈 시작

```bash
gemini
> /tutor
```

---

## tutor-setup

지식 소스를 구조화된 Notion StudyVault로 변환합니다. 프로젝트 마커를 기반으로 모드가 자동 감지됩니다:

| 발견된 마커 | 모드 |
|---|---|
| `package.json`, `pom.xml`, `build.gradle`, `Cargo.toml`, `go.mod` 등 | 코드베이스 모드 |
| 프로젝트 마커 없음 | 문서 모드 |

### 문서 모드 (Document Mode)

PDF, 텍스트 파일, 웹 페이지 등을 종합적인 학습 노트로 변환합니다.

- 작업 디렉토리 내 소스 파일 자동 스캔 (PDF, TXT, MD, HTML, EPUB)
- 검증된 소스 매핑을 통한 콘텐츠 추출 및 분석
- 비교 표, ASCII 다이어그램, 시험 패턴이 포함된 개념 노트 생성
- 숨겨진 정답이 포함된 연습 문제 생성 (Active Recall)
- MOC(Map of Content), 빠른 참조, 시험 함정이 포함된 대시보드 구축
- 모든 노트 간의 `[[wiki-links]]` 연결

### 코드베이스 모드 (Codebase Mode)

소스 코드 프로젝트로부터 신입 개발자를 위한 온보딩 vault를 생성합니다.

- 기술 스택, 아키텍처 패턴, 모듈 경계 자동 감지
- 엔드-투-엔드 요청 흐름 및 데이터 흐름 추적
- 주요 파일, 공개 인터페이스, 의존성 맵이 포함된 모듈별 노트 생성
- 온보딩 실습 과제 생성 (코드 읽기, 설정, 디버깅, 확장)
* 아키텍처 개요, 모듈 맵, API 명세가 포함된 대시보드 구축

---

## tutor

학습자가 아는 것과 모르는 것을 **개념 수준**에서 추적하는 대화형 퀴즈 튜터입니다. `tutor-setup`으로 생성된 모든 StudyVault에서 작동합니다.

### 진도 추적 (Progress Tracking)

숙련도는 배지로 표시됩니다:

| 배지 | 수준 | 정답률 |
|-------|-------|------|
| 🟥 | 부족 | 0–39% |
| 🟨 | 보통 | 40–69% |
| 🟩 | 양호 | 70–89% |
| 🟦 | 숙달 | 90–100% |
| ⬜ | 측정 전 | 데이터 없음 |

개념별 추적을 통해 시도 횟수, 정답 횟수, 최근 테스트 날짜, 오답 노트를 저장하므로, 드릴 세션에서는 틀렸던 개념을 새로운 맥락의 질문으로 다시 출제합니다.

## 요구 사항

- [Gemini CLI](https://github.com/google/gemini-cli) 설치 및 설정 완료
- [Notion 계정](https://www.notion.so/) 및 [Notion MCP](https://mcp.notion.com/mcp) 설정 완료
- Poppler (`pdftotext`) PDF 추출 도구

## 라이선스

[MIT](LICENSE)
DF 추출 도구

## 라이선스

[MIT](LICENSE)
