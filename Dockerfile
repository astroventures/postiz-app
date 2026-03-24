FROM ghcr.io/gitroomhq/postiz-app:v2.21.0

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
