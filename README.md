# FleetOps-infrastructure
## update the docker container in server(from development or production)

Use the provided update script for each environment. It pulls the latest image
and recreates the `api` service.

### development
```bash
cd development
./update.sh
```

### production
```bash
cd production
./update.sh
```

### manual commands
#### development
docker compose --env-file .env.dev -f docker-compose.dev.yml pull api \
  && docker compose --env-file .env.dev -f docker-compose.dev.yml up -d api

#### production
docker compose -f docker-compose.prod.yml pull api && docker compose -f docker-compose.prod.yml --env-file .env.prod up -d api



