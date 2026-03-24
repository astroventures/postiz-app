#!/bin/sh
# Railway injects PORT env var. Postiz nginx hardcodes listen 5000.
# NestJS backend also reads PORT — must unset before starting app.

RAILWAY_PORT="${PORT:-5000}"
sed -i "s/listen 5000/listen ${RAILWAY_PORT}/" /etc/nginx/nginx.conf

# Unset PORT so NestJS backend defaults to port 3000 (its expected port)
unset PORT

# Start nginx + app (same as upstream CMD)
nginx && pnpm run pm2
