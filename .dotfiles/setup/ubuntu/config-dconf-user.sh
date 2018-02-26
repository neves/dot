# Dump all configs to a file
dconf dump / > /tmp/config-dconf-user.conf
# Load local configs to system
dconf load / < "$(dirname $0)/config-dconf-user.conf"
# Watch for changes on config
# dconf watch /
