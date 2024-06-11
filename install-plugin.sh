if [ ! -d "$GF_PATHS_PLUGINS" ]; then
    mkdir "$GF_PATHS_PLUGINS"
fi

if [ ! -z "${GF_INSTALL_PLUGINS}" ]; then
  OLDIFS=$IFS
  IFS=','
  for plugin in ${GF_INSTALL_PLUGINS}; do
    IFS=$OLDIFS
    if [[ $plugin =~ .*\;.* ]]; then
        pluginUrl=$(echo "$plugin" | cut -d';' -f 1)
        pluginInstallFolder=$(echo "$plugin" | cut -d';' -f 2)
        grafana cli --pluginUrl ${pluginUrl} --pluginsDir "${GF_PATHS_PLUGINS}" plugins install "${pluginInstallFolder}"
    else
        grafana cli --pluginsDir "${GF_PATHS_PLUGINS}" plugins install ${plugin}
    fi
  done
fi
