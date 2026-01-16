# Tekton Dashboard (Customized Version)

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://github.com/tektoncd/dashboard/blob/main/LICENSE)
[![Go Report Card](https://goreportcard.com/badge/tektoncd/dashboard)](https://goreportcard.com/report/tektoncd/dashboard)

<p align="center">
  <img src="tekton-dashboard-color.svg" alt="Tekton Dashboard logo" width="200" />
</p>

Tekton Dashboard는 [Tekton Pipelines](https://github.com/tektoncd/pipeline)와 [Tekton Triggers](https://github.com/tektoncd/triggers) 리소스를 관리하기 위한 범용 웹 기반 UI입니다.

**이 저장소는 공식 Tekton Dashboard를 기반으로, 운영 효율성과 사용자 편의를 위해 주요 기능을 커스터마이징한 버전입니다.**

---

## 주요 변경 사항 (Custom Features)

이 커스텀 버전에는 다음과 같은 기능이 수정 및 추가되었습니다.

### 1. 파이프라인 재시작 로직 개선 (Smart Restart)
- **기존:** 'Start' 버튼 클릭 시 기존 리소스를 단순히 재실행.
- **변경:** 'Start' 버튼 클릭 시, 기존 설정을 기반으로 **새로운 PipelineRun 리소스를 생성**하여 실행합니다. 이를 통해 실행 이력을 보존하고 충돌 없이 즉시 재작업을 수행할 수 있습니다.

### 2. 검색 기능 직관화 (Basic Search)
- **기존:** Label 기반의 Key-Value 검색 방식.
- **변경:** 사용자가 더 쉽게 접근할 수 있도록 **일반 텍스트(키워드) 기반 검색** 방식으로 변경했습니다. 복잡한 셀렉터 문법 없이 이름이나 키워드로 리소스를 찾을 수 있습니다.

### 3. 파이프라인 종합 현황판 (Pipeline Status View)
- 전체 파이프라인의 실행 상태와 성공/실패 여부를 한눈에 파악할 수 있는 **시각화된 현황 대시보드**를 추가했습니다.

---

## 기본 기능 (Original Features)

Tekton Dashboard는 기본적으로 다음과 같은 기능을 제공합니다.

- `PipelineRun` 및 `TaskRun`의 실시간 상태 및 로그 조회
- 리소스 라벨 필터링
- 리소스 개요 및 YAML 명세 확인
- 전체 클러스터 조회 또는 특정 네임스페이스(Namespace)로 조회 범위 제한
- Git 리포지토리에서 리소스 직접 가져오기 (Import)
- 확장 프로그램(Extensions)을 통한 기능 추가

<img width="1897" height="927" alt="image" src="https://github.com/user-attachments/assets/d26d1a19-1bbf-4aa3-a2e0-2f9887dca8fb" />

## 문서 및 가이드

- **설치 방법:** [Installing Tekton Dashboard](./install.md)
- **튜토리얼:** ["Getting started" tutorial](./tutorial.md)
- **공식 릴리즈:** [releases](https://github.com/tektoncd/dashboard/blob/main/releases.md)

공식 문서 및 버전별 링크는 [Tekton 웹사이트](https://tekton.dev/docs)에서 확인할 수 있습니다.

## 브라우저 지원

Tekton Dashboard는 최신 모던 브라우저에서 테스트되었습니다.

- Google Chrome (Windows, macOS, Linux)
- Mozilla Firefox (Windows, macOS, Linux)
- Apple Safari (macOS)
- Microsoft Edge (Windows)

---

## 🤝 기여하기 (Contribution)

이 프로젝트는 오픈 소스이며, 기능 개선을 위한 제안이나 버그 리포트를 환영합니다.

---

<p align="small">
Except as otherwise noted, the content of this page is licensed under the <a href="https://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 License</a>. Code samples are licensed under the <a href="https://www.apache.org/licenses/LICENSE-2.0">Apache 2.0 License</a>.
</p>
