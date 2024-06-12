#!/bin/bash
# Copyright (c) Swarm Library Maintainers.
# SPDX-License-Identifier: MIT

set -e

SWARMLIBS_GF_INSTALL_PLUGINS="grafana-github-datasource,grafana-gitlab-datasource,grafana-sentry-datasource"
export GF_INSTALL_PLUGINS="${SWARMLIBS_GF_INSTALL_PLUGINS}${GF_INSTALL_PLUGINS:+,}${GF_INSTALL_PLUGINS}"

# Set default values for Grafana environment variables
export GF_LOG_LEVEL=${GF_LOG_LEVEL:-info}
export GF_METRICS_ENABLED=${GF_METRICS_ENABLED:-true}

# Disable all analytics and reporting
export GF_NEWS_ENABLED=${GF_NEWS_ENABLED:-false}
export GC_CHECK_FOR_UPDATES=${GC_CHECK_FOR_UPDATES:-false}
export GF_REPORTING_ENABLED=${GF_REPORTING_ENABLED:-false}
export GF_SUPPORT_BUNDLES_ENABLED=${GF_SUPPORT_BUNDLES_ENABLED:-false}

exec /run.sh "$@"
