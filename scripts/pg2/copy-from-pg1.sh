#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../../"

docker-compose exec postgres1 sh -c "pg_dump -v -U \$POSTGRES_USER -Fc -f /var/db.Fc.dump \$POSTGRES_DB"
mkdir -p ./dump/
docker cp $(docker-compose ps -q postgres1):/var/db.Fc.dump ./dump/db.Fc.dump
docker cp ./dump/db.Fc.dump $(docker-compose ps -q postgres2):/var/db.Fc.dump
docker-compose exec postgres2 sh -c "pg_restore --no-publications --no-subscriptions -v -c -U \$POSTGRES_USER -Fc -d \$POSTGRES_DB /var/db.Fc.dump"
