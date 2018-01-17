node_install_version=8.9.0

log "Installing nvm ..."
if [ ! -s "$NVM_DIR/nvm.sh" ] ; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | zsh
  source "$HOME/.nvm/nvm.sh"
  log "Installing node $node_install_version ..."
  nvm install "$node_install_version"
  nvm use "$node_install_version"
  nvm alias default node
else
  log "nvm already installed ..."
fi

log "Installing npm global packages ..."

npm i -g diff-so-fancy
npm i -g eslint
npm i -g flow-vim-quickfix
npm i -g gulp
npm i -g http-server
npm i -g imageoptim-cli
npm i -g json-to-js
npm i -g nodemon
npm i -g npm-check
npm i -g npmlist
npm i -g tern

log "Installing yarn ..."

curl -o- -L https://yarnpkg.com/install.sh | bash
