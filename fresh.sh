#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file $DOTFILES/Brewfile

# remove quarantine flag
xattr -r -d com.apple.quarantine '/Applications/Syntax Highlight.app'

# Install PHP extensions with PECL
#pecl install imagick

# Install Composer
#curl -sS https://getcomposer.org/installer | php
#mv composer.phar /usr/local/bin/composer

# Install global Composer packages
#/usr/local/bin/composer global require laravel/installer laravel/spark-installer laravel/valet

# Install Laravel Valet
#$HOME/.composer/vendor/bin/valet install

# Install global NPM packages
#npm install --global yarn
#npm install --global @angular/cli

# Install ruby 2.6.3 (cocoapods)
#rbenv install 2.6.3
#rbenv global 2.6.3

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Sites

mkdir $HOME/bin
mkdir $HOME/src
touch $HOME/.stCommitMsg

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Configure docker/zsh auto-completion
#etc=/Applications/Docker.app/Contents/Resources/etc
#ln -s $etc/docker.zsh-completion /usr/local/share/zsh/site-functions/_docker
#ln -s $etc/docker-machine.zsh-completion /usr/local/share/zsh/site-functions/_docker-machine
#ln -s $etc/docker-compose.zsh-completion /usr/local/share/zsh/site-functions/_docker-compose

# Symlink the Mackup config file to the home directory
ln -s $DOTFILES/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences
# We will run this last because this will reload the shell
source $DOTFILES/.macos
