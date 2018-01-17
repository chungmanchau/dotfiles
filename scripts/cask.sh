log() {
  local fmt="$1"; shift
  printf "\n\e[94m$fmt\n" "$@"
}

casks="$(brew cask list)"

install_cask() {
  if echo $casks | grep -w $1 > /dev/null 2>&1; then
    log "Already have %s installed. Skipping ..." "$1"
  else
    log "Installing %s ..." "$1"
    brew cask install "$@" 2> /dev/null
  fi
}

brew tap caskroom/cask
brew tap caskroom/versions

# Browsers
install_cask firefox
install_cask google-chrome-beta

# Cloud
install_cask cloud
install_cask dropbox
install_cask google-drive

# Comms
install_cask google-hangouts
install_cask skype

# Media
install_cask imageoptim
install_cask spotify
install_cask iina

# Development
install_cask atom
install_cask intellij-idea
install_cask gitify
install_cask iterm2-nightly
install_cask java
install_cask transmit
install_cask vmware-fusion

# Mac OS Enhancements
install_cask alfred
install_cask bartender
install_cask bettertouchtool
install_cask gpgtools
install_cask istat-menus
install_cask keepingyouawake
install_cask the-unarchiver

# Other stuff
install_cask appcleaner
install_cask daisydisk
install_cask deluge
install_cask flux

# Fonts
# https://github.com/caskroom/homebrew-fonts
brew tap caskroom/fonts
install_cask caskroom/fonts/font-hack
install_cask caskroom/fonts/font-hack-nerd-font

brew cask cleanup
