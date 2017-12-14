#! /bin/sh
mkdir -p ~/.config/digdag/
envsubst < /tmp/config.tmp > ~/.config/digdag/config
exec "$@"
