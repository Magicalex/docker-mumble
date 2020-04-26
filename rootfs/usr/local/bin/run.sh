#!/usr/bin/env sh

# Set config.ini for murmur server
if [ ! -e '/opt/mumble/conf/config.ini' ]; then
  cp /etc/mumble/config.ini /opt/mumble/conf/config.ini
fi

chown -R "${GID}:${GID}" /opt/mumble
exec su-exec "${UID}:${GID}" /opt/mumble/murmur.x86 -fg -ini /opt/mumble/conf/config.ini
