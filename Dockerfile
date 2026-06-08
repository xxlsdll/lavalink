# Official Lavalink v4 image. Plugins listed in application.yml are
# downloaded automatically on first start.
FROM ghcr.io/lavalink-devs/lavalink:4

COPY application.yml /opt/Lavalink/application.yml

EXPOSE 2333
