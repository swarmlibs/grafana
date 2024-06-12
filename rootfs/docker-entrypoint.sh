#!/bin/bash
# Copyright (c) Swarm Library Maintainers.
# SPDX-License-Identifier: MIT

set -e

# Default credentials
export GF_SECURITY_ADMIN_USER=${GF_SECURITY_ADMIN_USER:-grafana}
export GF_SECURITY_ADMIN_PASSWORD=${GF_SECURITY_ADMIN_PASSWORD:-grafana}

# Set default values for Grafana environment variables
export GF_LOG_LEVEL=${GF_LOG_LEVEL:-info}
export GF_METRICS_ENABLED=${GF_METRICS_ENABLED:-true}
export GF_USERS_ALLOW_SIGN_UP=${GF_USERS_ALLOW_SIGN_UP:-false}

# Disable all analytics and reporting
export GF_ANALYTICS_CHECK_FOR_UPDATES=${GF_ANALYTICS_CHECK_FOR_UPDATES:-false}
export GF_ANALYTICS_FEEDBACK_LINKS_ENABLED=${GF_ANALYTICS_FEEDBACK_LINKS_ENABLED:-false}
export GF_ANALYTICS_REPORTING_ENABLED=${GF_ANALYTICS_REPORTING_ENABLED:-false}
export GF_NEWS_NEWS_FEED_ENABLED=${GF_NEWS_NEWS_FEED_ENABLED:-false}
export GF_SUPPORT_BUNDLES_ENABLED=${GF_SUPPORT_BUNDLES_ENABLED:-false}

# Enable feature toggles
export GF_FEATURE_TOGGLES_ENABLE=${GF_FEATURE_TOGGLES_ENABLE:-true}

# Plugins
export SWARMLIBS_GF_INSTALL_PLUGINS="grafana-github-datasource,grafana-gitlab-datasource,grafana-sentry-datasource"
export GF_INSTALL_PLUGINS="${SWARMLIBS_GF_INSTALL_PLUGINS}${GF_INSTALL_PLUGINS:+,}${GF_INSTALL_PLUGINS}"

exec /run.sh "$@"
