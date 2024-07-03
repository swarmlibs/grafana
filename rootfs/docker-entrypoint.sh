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

echo "Generating dashboard provisioning configuration..."
cat <<EOT > "/etc/grafana/provisioning/dashboards/grafana-dashboards.yml"
apiVersion: 1
providers:
  - name: 'dashboards'
    orgId: 1
    type: file
    disableDeletion: true
    allowUiUpdates: false
    updateIntervalSeconds: 60
    options:
      path: /grafana/dashboards
      foldersFromFilesStructure: true
EOT
cat <<EOT > "/etc/grafana/provisioning/dashboards/grafana-provisioning-dashboard.yml"
apiVersion: 1
providers:
  - name: 'grafana-provisioning-dashboard'
    orgId: 1
    type: file
    disableDeletion: true
    allowUiUpdates: false
    updateIntervalSeconds: 60
    options:
      path: /etc/grafana/dashboards
      foldersFromFilesStructure: true
EOT

exec /run.sh "$@"
