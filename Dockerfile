FROM alpine:3.9

LABEL description "Server murmur" \
      maintainer="Magicalex <magicalex@mondedie.fr>"

ARG VERSION=1.2.19
ENV GID=991 UID=991
COPY rootfs /

RUN apk add -U \
    gnupg \
    su-exec \
  && wget https://github.com/mumble-voip/mumble/releases/download/$VERSION/murmur-static_x86-$VERSION.tar.bz2 \
  && wget https://github.com/mumble-voip/mumble/releases/download/$VERSION/murmur-static_x86-$VERSION.tar.bz2.sig \
  && gpg --receive-keys 88048D0D625297A0 \
  && gpg --verify murmur-static_x86-$VERSION.tar.bz2.sig murmur-static_x86-$VERSION.tar.bz2 \
  && tar xjf murmur-static_x86-$VERSION.tar.bz2 \
  && rm -R murmur-static_x86-$VERSION.tar.bz2.sig murmur-static_x86-$VERSION.tar.bz2 \
  && mv murmur-static_x86-$VERSION /opt/mumble \
  && chown -R $GID:$GID /etc/mumble /opt/mumble \
  && chmod +x /usr/local/bin/* /opt/mumble/murmur.x86

VOLUME /opt/mumble/conf /opt/mumble/data
EXPOSE 64738 64738/udp
CMD ["run.sh"]
