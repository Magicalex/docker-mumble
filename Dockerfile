FROM alpine:3.13

LABEL description "Murmur server" \
      tags="latest" \
      maintainer="Magicalex <magicalex@mondedie.fr>"

ENV GID=991 UID=991
COPY rootfs /

RUN apk add --no-progress --no-cache \
    murmur \
    su-exec \
  && chmod +x /usr/local/bin/*

VOLUME /opt/mumble/conf /opt/mumble/data
EXPOSE 64738 64738/udp
CMD ["/usr/local/bin/startup"]
