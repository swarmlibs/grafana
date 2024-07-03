ARG GRAFANA_VERSION=latest
FROM grafana/grafana:${GRAFANA_VERSION}

# Temporary switch to root to install packages
USER root
RUN apk add --no-cache inotify-tools
USER 472

ADD rootfs /
VOLUME [ "/grafana/dashboards" ]
ENTRYPOINT [ "/docker-entrypoint.sh" ]
