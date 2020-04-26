#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

docker-compose stop postgres2
rm volumes/postgres2 -rf
docker-compose up -d postgres2
./scripts/wait-service.sh postgres2 5432
./scripts/pg2/create-extensions.sh
./scripts/pg2/copy-from-pg1.sh
./scripts/pg2/create-subscriptions.sh