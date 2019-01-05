# Shadowsocks
# Cogset Open Source Group

FROM debian:jessie

MAINTAINER Cogset <cogset@funcuter.org>

RUN groupadd -r shadowsocks && useradd -r -g shadowsocks shadowsocks

ENV SHADOWSOCKS_VERSION v3.2.3

# Install
RUN buildDeps="wget autoconf make g++ libssl-dev libpcre3-dev ca-certificates" \
    && apt-get update \
    && apt-get install -y --no-install-recommends pwgen build-essential libtool asciidoc xmlto $buildDeps \
    && wget -O shadowsocks.tar.gz "https://github.com/shadowsocks/shadowsocks-libev/archive/$SHADOWSOCKS_VERSION.tar.gz" \
    && mkdir -p /usr/src/shadowsocks \
    && tar -xzf shadowsocks.tar.gz -C /usr/src/shadowsocks --strip-components=1 \
    && rm shadowsocks.tar.gz \
    && cd /usr/src/shadowsocks \
    && ./configure \
    && make \
    && make install \
    && cd / \
    && rm -rf /usr/src/shadowsocks \
    && apt-get purge -y --auto-remove $buildDeps \
    && rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8989

CMD ["ss-server"]
