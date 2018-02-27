# gsettings list-recursively | grep -i 
# MOUSE
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true
gsettings set org.gnome.desktop.peripherals.mouse speed 1

# KEYBOARD
gsettings set org.gnome.desktop.peripherals.keyboard delay 200
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 15

# KEYMAP
# Overview
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:super']"
# Alternar de apps igual o Mac
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Primary>Tab']"
# CMD+SPACE
gsettings set org.gnome.shell.keybindings toggle-overview "['<Primary>space']"
# Alternar entre janelas do App
gsettings set org.gnome.desktop.wm.keybindings cycle-group-backward "['<Primary><Shift>apostrophe']"
gsettings set org.gnome.desktop.wm.keybindings switch-group-backward "['<Shift><Super>Above_Tab', '<Shift><Alt>Above_Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-group "['<Super>Above_Tab', '<Alt>Above_Tab']"

# CLOCK
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-date true

# DOCK
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'RIGHT'

# SYSTEM
gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend false

# EDITOR
gsettings set org.gnome.gedit.preferences.editor tabs-size 2
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor scheme 'cobalt'
gsettings set org.gnome.gedit.preferences.editor display-right-margin true
