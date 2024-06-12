ARG GRAFANA_VERSION=latest
FROM grafana/grafana:${GRAFANA_VERSION}
ADD rootfs /
ENTRYPOINT [ "/docker-entrypoint.sh" ]
