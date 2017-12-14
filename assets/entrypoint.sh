#! /bin/sh
docker-entrypoint.sh
digdag-entrypoint.sh
exec "$@"
