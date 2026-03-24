#!/bin/sh
set -e

echo "[entrypoint] Starting Postiz..."
echo "[entrypoint] PORT env: ${PORT:-not set}"

RAILWAY_PORT="${PORT:-5000}"
echo "[entrypoint] Nginx will listen on: ${RAILWAY_PORT}"
sed -i "s/listen 5000/listen ${RAILWAY_PORT}/" /etc/nginx/nginx.conf

# Unset PORT so NestJS backend defaults to port 3000
unset PORT

echo "[entrypoint] Starting nginx..."
nginx
echo "[entrypoint] Nginx started. Starting pm2..."
exec pnpm run pm2
