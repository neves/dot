echo "\n$(tput setaf 1)Installing watchman$(tput sgr 0)\n"
# dependencies
sudo apt-get install -y autoconf automake build-essential python-dev libtool m4 pkg-config
# increase settings
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_watches
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_queued_events
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_instances

tmp="${TMP:-/tmp}"
dir="$tmp/watchman.git"
test -d "$dir" || git clone https://github.com/facebook/watchman.git "$dir"
cd "$dir"
# get latest tag
tag=$(git describe $(git rev-list --tags --max-count=1))
git checkout "$tag"
./autogen.sh
./configure
make
sudo make install
watchman --version
