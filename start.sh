#!/bin/bash
set -e

if [ -z $@ ]; then
    chown -R ircd:ircd "/opt/inspircd"
    exec su - -c "/opt/inspircd/bin/inspircd --nofork"  ircd
    exit 
fi

exec "$@"
