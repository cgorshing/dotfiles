# Install Apps
Firefox - Sign in to sync, bring up sync sidebar, select the correct machine to restore all tabs
--iTerm2--
ghostty
Chrome & Brave
1password
Alfred
Copy/Paste app

# Did a cli tools install somewhere along here - it was an auto-popup

Changed display to not auto-dim
Set caps lock to control

Docker wanted to install Rosetta on my mac, I don't want that
So when needing Postgres, I use Postgres.app instead of Docker


TODO I couldn't find this
Set network for wireless to not hide/random the mac
Check on the settings for Purple and Whiteblue


Change shell to bash before doing homebrew
$ chsh -s /bin/bash

Run this in the shell until dotfiles are setup/configured
$ eval "$(/opt/homebrew/bin/brew shellenv)"

Do I still need this?
Installing Homebrew and Anaconda on a Mac https://gist.github.com/ryanorsinger/7d89ad58901b5590ec3e1f23d7b9f887

Install asdf-vm

Beyond Compare
SourceTree
p4merge - optional
SublimeText - ~/Library/Application Support/Sublime Text
Download Office
Docker - not yet (on an M2)
Acrobat Reader
Postico
Amazon Corretto
Logi Options+
Postman
VMWare Fusion
ImHex

Lots of JetBrains IDE's - pycharm, Intellij, clion, rubymine, goland, dataspell
Pycharm doesn't use asdf well (might look at pointing pycharm to the ~/.asdf path for python)
But I ended up installing Python as a pkg - I did a customize and turned off LOTS of things.

Fira Code -- I seem to be using this more than Berkeley
Berkeley Mono font

Restore ~/Downloads
Restore ~/workspaces
Restore ~/.ssh
Restore ~/.config

gpg import keys


Add /opt/homebrew/bin/bash to allowable shells
sudo vi /etc/shells
chsh<enter> or chsh -s /opt/homebrew/bin/bash
