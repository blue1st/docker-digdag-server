#! /bin/sh
envsubst < /root/.config/digdag/config.tmp > /root/.config/digdag/config
exec $@
