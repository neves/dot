# Dump all configs to a file
dconf dump / > /tmp/config-dconf-user.conf
# Load local configs to system
dconf load / < "${0:h}/config-dconf-user.conf"
# Watch for changes on config
# dconf watch /
