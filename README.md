# Servarr Media Server 
This repo contains list of containers for running Plex media server with Radarr/Sonarr. 

## Prerequisites
- docker
- docker compose plugin 2.20.2+

## How to run
Create .env file
```
VOL_ROOT=<root folder>
VOL_MEDIA=<path to media files>

HOST_USER=plex
HOST_PASS=plex
# if you have windows share
VOL_WINSHARE=//<ip address>/Videos

PUID=1000
PGID=1000

PLEX_TOKEN=xxx
RADARR_TOKEN=xxx
RADARR_URL=http://radarr:7878
SONARR_TOKEN=xxx
SONARR_URL=http://sonarr:8989
PROWLARR_TOKEN=xxx
PROWLARR_URL=http://prowlarr:9696

# if you use radarr against postgres db, set the creds here
POSTGRES_USER=xxx
POSTGRES_PASSWORD=xxx
```

Create folders in $VOL_ROOT path
```
mkdir -p media plex qbittorrent nzbget radarr sonarr bazarr prowlarr ombi organizr
```

## Run
```
docker compose up -d

# see logs
docker compose logs -f
```
