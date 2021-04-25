# homebrew
if test ! "$(which brew)"; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  # Make sure we are using the latest Homebrew
  brew update
  # Upgrade any already-installed formulae
  brew upgrade --all
fi

# java stuff
## jdk
brew install openjdk
sudo ln -sfn \
"$(brew --prefix)"/opt/openjdk/libexec/openjdk.jdk \
/Library/Java/JavaVirtualMachines/openjdk.jdk
## build tools
brew install maven
brew install gradle

# cli
brew install git # Do I really need it?
brew install coreutils # dircolors?
brew install pygments # plugins/colorize
brew install httpie
brew install protobuf
brew install tree
brew install fzf
brew install lua # need for z.lua
brew install jq
brew install yq
brew install awscli
brew install exa # modern ls

# utility
brew install glances
# brew install mkcert # https://github.com/FiloSottile/mkcert see PiterJS #50 on youtube

# iaac stuff
brew install packer
brew install ansible
brew install terraform

# containers stuff
brew install dive # container layers inspection tool
brew install helm
brew install istioctl

# websocket client
brew install websocat

# tmux stuff
brew install tmux
brew install tmux-mem-cpu-load

# apps
brew install rectangle
brew install --cask visual-studio-code
brew install --cask intellij-idea
brew install --cask iterm2
brew install --cask slack
brew install --cask docker


brew cleanup



# zplug
curl -sL --proto-redir -all,https \
https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
