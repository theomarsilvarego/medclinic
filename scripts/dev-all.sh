#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

printf '\n==> Instalando dependências do server\n'
npm install --prefix "$ROOT_DIR/server"

printf '\n==> Instalando dependências do client\n'
npm install --prefix "$ROOT_DIR/client"

printf '\n==> Compilando server\n'
npm run build --prefix "$ROOT_DIR/server"

printf '\n==> Compilando client\n'
npm run build --prefix "$ROOT_DIR/client"

printf '\n==> Iniciando server e client\n'
printf '    API:    http://localhost:3333\n'
printf '    Client: http://localhost:5173\n\n'

cleanup() {
  trap - INT TERM EXIT
  kill "$SERVER_PID" "$CLIENT_PID" 2>/dev/null || true
  wait "$SERVER_PID" "$CLIENT_PID" 2>/dev/null || true
}
trap cleanup INT TERM EXIT

(cd "$ROOT_DIR/server" && npm run dev) & SERVER_PID=$!
(cd "$ROOT_DIR/client" && npm run dev) & CLIENT_PID=$!

wait "$SERVER_PID" "$CLIENT_PID"
