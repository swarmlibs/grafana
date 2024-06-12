ARG GRAFANA_VERSION=latest
FROM grafana/grafana:${GRAFANA_VERSION}

RUN --mount=type=bind,source=./gf-plugins.txt,target=/tmp/gf-plugins.txt \
    cat /tmp/gf-plugins.txt | xargs -I {} grafana cli --pluginsDir "${GF_PATHS_PLUGINS}" plugins install {}

ADD rootfs /
