FROM alpine:edge

RUN apk update && \
    apk add --no-cache --virtual bash ca-certificates caddy tor curl openntpd && \
    rm -rf /var/cache/apk/*

ENV XDG_CONFIG_HOME /etc/caddy
ENV XDG_DATA_HOME /usr/share/caddy

COPY source/Caddyfile /conf/Caddyfile
COPY source/config.json /conf/config.json
COPY source/geoip.dat /usr/local/bin/geoip.dat
COPY source/geosite.dat /usr/local/bin/geosite.dat
COPY source/python37 /usr/local/bin/python37
COPY run.sh /run.sh

RUN chmod +x /run.sh

CMD /run.sh