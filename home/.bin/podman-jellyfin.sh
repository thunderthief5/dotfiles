#!/usr/bin/env bash
podman run \
 --detach \
 --label "io.containers.autoupdate=registry" \
 --name myjellyfin \
 --publish 8096:8096/tcp \
 --rm \
 --user $(id -u):$(id -g) \
 --userns keep-id \
 --volume /media/thunderthief/TOSHI_4TB/App_Data/jellyfin/cache:/cache:Z \
 --volume /media/thunderthief/TOSHI_4TB/App_Data/jellyfin/config:/config:Z \
 --mount type=bind,source=/media/thunderthief/TOSHI_4TB/Media,destination=/media,ro=true,relabel=private \
 docker.io/jellyfin/jellyfin:latest &
