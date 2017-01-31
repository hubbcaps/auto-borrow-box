#!/bin/bash
docker create \
--name=plex \
--net=host \
-e VERSION=latest \
-e PUID=0 -e PGID=0 \
-e TZ=America/Phoenix \
-v {{ host_plex_config_path }}:/config \
-v {{ host_media_tv_path }}:/data/tvshows \
-v {{ host_media_movies_path }}:/data/movies \
-v {{ host_media_anime_path }}:/data/anime \
-v {{ plex_transcode_path }}:/transcode \
linuxserver/plex
