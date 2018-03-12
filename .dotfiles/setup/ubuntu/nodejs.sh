# não instalar globalmente, pois precisa de sudo para utilizar
# curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
# sudo apt install -y nodejs

# preferir instalar localmente
curl -L https://git.io/n-install | bash -s -- -y -n
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

which node
node -v
which npm
npm -v
npm get prefix

echo NPM MODULES:
ls "$(npm get prefix)/lib/node_modules"

echo NPM BINs:
ls "$(npm get prefix)/bin"

# auto switch version based on .node-version
npm install -g avn avn-n
# install google cloud function node version
n 6.11.5
# install aws lambda node version
n 6.10.3

avn setup
echo 'REMOVE ADDED LINE BY AVN AT END OF ~/.zshrc'
