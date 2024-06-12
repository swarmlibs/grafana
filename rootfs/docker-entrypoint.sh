#!/bin/bash
# Copyright (c) Swarm Library Maintainers.
# SPDX-License-Identifier: MIT

set -e

SWARMLIBS_GF_INSTALL_PLUGINS="grafana-github-datasource,grafana-gitlab-datasource,grafana-sentry-datasource"
export GF_INSTALL_PLUGINS="${SWARMLIBS_GF_INSTALL_PLUGINS}${GF_INSTALL_PLUGINS:+,}${GF_INSTALL_PLUGINS}"

exec /run.sh "$@"
