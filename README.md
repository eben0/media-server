# Servarr Media Server 
This repo contains a set of *arr containers for running Plex media server with Radarr/Sonarr/etc apps. 

## Prerequisites
- docker
- docker compose plugin 2.20.2+
- loki docker plugin
```
 docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permission
```

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

## *arr apps

| App         | Port   | Description                  |
|:------------|:-------|:-----------------------------|
| organizr    | 80     | Homelab services organizer   |
| Plex        | 32400  | Plex Media Server            |
| plexsync    | -      | Tool to sync plex watchlist  |
| qbittorrent | 8080   | BitTorrent client            |
| nzbget      | 6789   | Usenet client                |
| radarr      | 7878   | Movie collection manager     |
| sonarr      | 8989   | TV Shows collection manager  |
| bazarr      | 6767   | Subtitles manager            |
| prowlarr    | 6767   | Indexer manager              |
| ombi        | 9696   | Content requester            |

## Monitoring apps

| App               | Port | Description          |
|:------------------|:-----|:---------------------|
| grafana           | 3000 | Analytics dashboard  |
| grafana           | 9090 | Metrics              |
| loki              | 3100 | Logs aggregator      |
| promtail          | -    | Logs agent           |
| cadvisor          | -    | Container metrics    |
| portainer         | 9000 | Docker management    |
| sonarr-exporter   | -    | sonarr metrics       |
| sonarr-exporter   | -    | radarr metrics       |
| prowlarr-exporter | -    | prowlarr metrics     |
| node-exporter     | -    | host machine metrics |

# Databases

| App       | Port  | Description                   |
|:----------|:------|:------------------------------|
| postgres  | 5432  | database to store arr config  |
| adminer   | 8181  | database admin ui             |