#! /bin/sh
docker-entrypoint.sh dockerd
digdag-entrypoint.sh
exec "$@"
