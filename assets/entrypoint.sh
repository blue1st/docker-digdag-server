#! /bin/sh
docker-entrypoint.sh dockerd &
digdag-entrypoint.sh
sleep 5
exec "$@"
