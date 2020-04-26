FROM alpine:3.10

LABEL description "Murmur server" \
      tags="latest" \
      maintainer="Magicalex <magicalex@mondedie.fr>"

ARG VERSION=1.3.0-rc1
ENV GID=991 UID=991
COPY rootfs /

RUN apk add -U \
    gnupg \
    curl \
    su-exec \
  && wget https://github.com/mumble-voip/mumble/releases/download/$VERSION/murmur-static_x86-$VERSION.tar.bz2 \
  && wget https://github.com/mumble-voip/mumble/releases/download/$VERSION/murmur-static_x86-$VERSION.tar.bz2.sig \
  && curl https://raw.githubusercontent.com/mumble-voip/mumble-gpg-signatures/master/mumble-auto-build-2020.asc | gpg --import \
  && gpg --verify murmur-static_x86-$VERSION.tar.bz2.sig murmur-static_x86-$VERSION.tar.bz2 \
  && tar -xjf murmur-static_x86-$VERSION.tar.bz2 \
  && rm -R murmur-static_x86-$VERSION.tar.bz2.sig murmur-static_x86-$VERSION.tar.bz2 \
  && mv murmur-static_x86-$VERSION /opt/mumble \
  && chown -R $GID:$GID /etc/mumble /opt/mumble \
  && chmod +x /usr/local/bin/* /opt/mumble/murmur.x86 \
  && apk del gnupg curl \
  && rm -rf /var/cache/apk/*

VOLUME /opt/mumble/conf /opt/mumble/data
EXPOSE 64738 64738/udp
CMD ["run.sh"]
