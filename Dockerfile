# ---------- 1) UI 빌드 (Node 20) ----------
FROM node:25-bullseye AS ui
WORKDIR /src

# 의존성
COPY package*.json ./
RUN npm ci || npm install

# 소스 복사
COPY . .

# Vite 빌드: 산출물을 /ui-web 로 "고정" 생성 (탐색 불필요)
# 루트에 index.html, vite.config.js가 있으므로 이 한 줄이면 충분
RUN npx --yes vite@latest build --outDir /ui-web --base ./

# ---------- 2) Go 빌드 (Go 1.24+) ----------
FROM golang:1.24-bullseye AS gobuild
ENV CGO_ENABLED=0 GOOS=linux GOARCH=amd64
WORKDIR /work

# 모듈 사전 다운로드(속도)
COPY go.mod go.sum ./
RUN --mount=type=cache,target=/go/pkg/mod go mod download

# 소스 복사 및 빌드
COPY . .
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    go build -ldflags="-s -w" -o /dashboard ./cmd/dashboard

# ---------- 3) 런타임 (distroless/nonroot) ----------
FROM gcr.io/distroless/static:nonroot
USER 65532:65532
COPY --from=gobuild /dashboard /dashboard
COPY LICENSE NOTICE /licenses/
# UI 정적파일을 서버가 읽는 경로로 복사
COPY --from=ui /ui-web /var/run/ko
# 서버가 여기서 정적파일을 찾도록 지시
ENV WEB_RESOURCES_DIR=/var/run/ko
ENV KO_DATA_PATH=/var/run/ko
EXPOSE 9097
ENTRYPOINT ["/dashboard"]
