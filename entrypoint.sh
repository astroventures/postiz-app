#!/bin/sh
# Railway injects PORT env var. Postiz nginx hardcodes listen 5000.
# This script patches nginx to listen on $PORT at runtime.

PORT="${PORT:-5000}"
sed -i "s/listen 5000/listen ${PORT}/" /etc/nginx/nginx.conf

# Start nginx + app (same as upstream CMD)
nginx && pnpm run pm2
