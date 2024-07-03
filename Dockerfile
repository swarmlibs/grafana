ARG GRAFANA_VERSION=latest
FROM grafana/grafana:${GRAFANA_VERSION}
ADD rootfs /
VOLUME [ "/grafana/dashboards" ]
ENTRYPOINT [ "/docker-entrypoint.sh" ]
