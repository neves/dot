# hibernation nao funciona no kernel 4.13.0-32
# https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1743094?comments=all
# gsettings list-recursively | grep -i 
# MOUSE
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true
gsettings set org.gnome.desktop.peripherals.mouse speed 1

# KEYBOARD
gsettings set org.gnome.desktop.peripherals.keyboard delay 200
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 15

# KEYMAP
# Overview
gsettings set org.gnome.desktop.input-sources xkb-options ['caps:super']
# Alternar de apps igual o Mac
gsettings set org.gnome.desktop.wm.keybindings switch-applications ['<Primary>Tab']
# CMD+SPACE
org.gnome.shell.keybindings toggle-overview ['<Primary>space']
# Alternar entre janelas do App
gsettings set org.gnome.desktop.wm.keybindings cycle-group-backward ['<Primary><Shift>apostrophe']
gsettings set org.gnome.desktop.wm.keybindings switch-group-backward ['<Shift><Super>Above_Tab', '<Shift><Alt>Above_Tab']
gsettings set org.gnome.desktop.wm.keybindings switch-group ['<Super>Above_Tab', '<Alt>Above_Tab']

# CLOCK
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-date true

# DOCK
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.extensions.shell.dash-to-dock dock-position 'RIGHT'

# SYSTEM
gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend false

# EDITOR
gsettings set org.gnome.gedit.preferences.editor tabs-size 2
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor scheme 'cobalt'
gsettings set org.gnome.gedit.preferences.editor display-right-margin true

# internet mais rápida
sudo tee /proc/sys/net/ipv6/conf/all/disable_ipv6 <<< "1"

# aumentar o limite de watches para auto reload do webpack funcionar
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

update sudo apt
sudo apt install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
sudo apt install -y apt-transport-https ca-certificates software-properties-common sqlite3 libsqlite3-dev 
sudo apt install -y zsh
chsh -s /bin/zsh
sudo apt install -y curl
sudo apt install -y git gitk
sudo apt install -y icdiff
# like mac's pbcopy
sudo apt install -y xclip
# sudo apt install -y snapd # instalado por padrão a partir 16.04 LTS
sudo apt install -y silversearcher-ag

sudo snap login marcos.neves@gmail.com

sudo apt install -y gnome-tweak-tool
sudo apt install -y chrome-gnome-shell
# to work this gnome extension https://extensions.gnome.org/extension/1043/gnomestatspro/
sudo apt install -y gir1.2-gtop-2.0 gir1.2-networkmanager-1.0

# YADM
sudo apt -y install yadm
yadm clone git@github.com:neves/dot.git

# MYSQL
sudo apt -y install mysql-server
sudo systemctl disable mysql

# DOCKER
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce
sudo groupadd docker
sudo systemctl enable docker

# MOUSE WHEEL SPEED
sudo apt install -y imwheel
cat <<'EOF' >> ~/.imwheelrc
".*"
None,      Up,   Button4, 4
None,      Down, Button5, 4
Control_L, Up,   Control_L|Button4
Control_L, Down, Control_L|Button5
Shift_L,   Up,   Shift_L|Button4
Shift_L,   Down, Shift_L|Button5
EOF

cat <<'EOF' >> ~/.config/autostart/imwheel.desktop
[Desktop Entry]
Type=Application
Exec=imwheel
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=imwheel
Name=imwheel
Comment[en_US]=Adjust Scrool Speed
Comment=Ajustar Velocidade do Scrool
EOF

# Alternativa: https://askubuntu.com/questions/255890/how-can-i-adjust-the-mouse-scroll-speed

# REMAP KEYBOARD
# https://askubuntu.com/questions/24916/how-do-i-remap-certain-keys-or-devices
# convert Insert to Enter
xmodmap -e "keycode 118 = Return"

# Tecla Home muito próxima do BackSpace
xmodmap -e "keycode 110 = BackSpace"
# Trocar Control com Alt
# não precisa mais pois foi configurado com gsettings
# xmodmap -e "keycode 64 = Control_L"
# xmodmap -e "keycode 37 = Alt_L"
# Salva remap
xmodmap -pke > ~/.Xmodmap
echo "xmodmap .Xmodmap" >> ~/.xinitrc

# TILIX (melhor terminal, equivalente ao iterm)
sudo add-apt-repository -y ppa:webupd8team/terminix
sudo apt update
sudo apt install -y tilix

# ASDF
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.1
# ruby
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 2.5.0
asdf global ruby 2.5.0
# node
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 9.5.0
asdf global nodejs 9.5.0
# python local to avoid using sudo
asdf plugin-add python
asdf install python 2.7.14
asdf global python 2.7.14

# YARN
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -y yarn

# VSCODE
wget -c -O vscode.deb 'https://go.microsoft.com/fwlink/?LinkID=760868'
sudo dpkg -i vscode.deb
code --install-extension nonoroazoro.syncing

# AWS
pip install awscli aws-shell
asdf reshim python
# precisa do docker e só funciona com npm, não com yarn
npm install -g aws-sam-local

# HEROKU
sudo snap install heroku --classic

# MULTIPLE CLIPBOARDS
sudo add-apt-repository ppa:hluk/copyq
sudo apt update
sudo apt install copyq



# SENSORS
sudo apt install -y lm-sensors stress hardinfo psensor
sudo sensors-detect
/etc/init.d/kmod start
sudo service module-init-tools start
pip install s-tui && asdf reshim python
stress -c 4 -t 60
sensors -u
watch cat /sys/class/thermal/thermal_zone0/temp

# COMMANDS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# suspend: systemctl suspend
