FROM alpine AS builder
RUN apk add --no-cache git make gcc musl-dev libxml2-dev curl-dev openssl-dev shadow

RUN git clone https://git.bwaaa.monster/beaker /build/beaker && \
    cd /build/beaker && make && make install

RUN git clone https://git.bwaaa.monster/omnisearch /build/omnisearch && \
    cd /build/omnisearch && make

FROM alpine
RUN apk add --no-cache libxml2 libcurl openssl shadow && \
    addgroup -S omnisearch && adduser -S -G omnisearch omnisearch

COPY --from=builder /build/omnisearch/bin/omnisearch /usr/bin/omnisearch
COPY --from=builder /build/omnisearch /etc/omnisearch
COPY --from=builder /usr/lib/libbeaker.so /usr/lib/libbeaker.so

RUN mkdir -p /etc/omnisearch/config /var/cache/omnisearch && \
    chown -R omnisearch:omnisearch /etc/omnisearch /var/cache/omnisearch

RUN <<'EOF' cat > /entrypoint.sh && chmod +x /entrypoint.sh
#!/bin/sh
set -e

if [ ! -f /etc/omnisearch/config/config.ini ]; then
    echo "No config found on host. Copying the example..."
    cp /etc/omnisearch/example-config.ini /etc/omnisearch/config/config.ini
fi

ln -sf /etc/omnisearch/config/config.ini /etc/omnisearch/config.ini

if [ -n "$APP_NAME" ]; then
    echo "Setting app name to $APP_NAME..."

    PREV_NAME="OmniSearch"
    if [ -f /etc/omnisearch/.prev_app_name ]; then
        PREV_NAME=$(cat /etc/omnisearch/.prev_app_name)
    fi

    find /etc/omnisearch/templates /etc/omnisearch/static \
        -type f | xargs sed -i \
        -e "s/Omni<span>Search<\/span>/$APP_NAME/g" \
        -e "s/omni<span>search<\/span>/$APP_NAME/g" \
        -e "s/OmniSearch/$APP_NAME/g" \
        -e "s/omnisearch/$APP_NAME/g" \
        -e "s/$PREV_NAME/$APP_NAME/g"

    echo "$APP_NAME" > /etc/omnisearch/.prev_app_name
fi

exec "$@"
EOF

WORKDIR /etc/omnisearch
EXPOSE 8087
ENTRYPOINT ["/entrypoint.sh"]
CMD ["omnisearch"]
