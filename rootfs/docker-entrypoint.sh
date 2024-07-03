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

# Unified Alerting
export GF_UNIFIED_ALERTING_ENABLED=${GF_UNIFIED_ALERTING_ENABLED:-true}
export GF_UNIFIED_ALERTING_HA_LISTEN_ADDRESS=${GF_UNIFIED_ALERTING_HA_LISTEN_ADDRESS:-":9094"}
export GF_UNIFIED_ALERTING_HA_PEERS=${GF_UNIFIED_ALERTING_HA_PEERS:-"tasks.grafana:9094"}
export GF_UNIFIED_ALERTING_HA_ADVERTISE_ADDRESS=${GF_UNIFIED_ALERTING_HA_ADVERTISE_ADDRESS:-":9094"}
export GF_UNIFIED_ALERTING_HA_PEER_TIMEOUT=${GF_UNIFIED_ALERTING_HA_PEER_TIMEOUT:-"15s"}

# Add a watchdog to monitor the provisioning directory
echo "Starting watchdog to monitor provisioning directory..."
sleep 15
exec /watchdog "${GF_PATHS_PROVISIONING}" /run.sh "$@"
