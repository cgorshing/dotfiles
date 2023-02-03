#!/bin/sh

# Normally I install using git clone https://github.com/asdf-vm/asdf.git ~/.asdf

sudo apt-get update && sudo apt-get -y dist-upgrade
sudo apt install -y build-essential automake autoconf libssl-dev libncurses5-dev zlib1g-dev zip

# TODO Do I want to do this?
sudo apt install -y postgresql postgresql-contrib

# For phoenix live-reload
sudo apt install -y inotify-tools

# The asdf-vm default jq plugin (from focused labs) works fine on macos but is broken for linux, using another one
asdf plugin add jq https://github.com/AZMCode/asdf-jq.git # Update 2023-01-08 This is still accurate https://github.com/asdf-vm/asdf-plugins
asdf plugin update jq patch-1 # 2023-01-08 Don't think this is needed anymore. Not using it on the WSL instances anymore

asdf plugin add deno
asdf plugin add elixir
asdf plugin add erlang
asdf plugin add golang
asdf plugin add kotlin
asdf plugin add nodejs
asdf plugin add python
asdf plugin add ruby
asdf plugin add rust


# For nodejs - I needed to add gpg keys see https://github.com/asdf-vm/asdf-nodejs
# bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
asdf install deno   1.2.2
asdf install erlang 23.0.3
asdf install elixir 1.10.4-otp-23
asdf install golang 1.14.7
asdf install jq     jq-1.6
asdf install kotlin 1.4-M3
asdf install nodejs 14.7.0
asdf install python 3.8.5
asdf install ruby   2.7.1
asdf install rust   1.45.2


#WARNING: The Python bz2 extension was not compiled. Missing the bzip2 lib?
#WARNING: The Python readline extension was not compiled. Missing the GNU readline lib?
#WARNING: The Python sqlite3 extension was not compiled. Missing the SQLite3 lib?

# ~/.tool-version
#elixir 1.10.4-otp-23
#erlang 23.0.3
#deno  1.2.2
#golang  1.14.7
#jq  jq-1.6
#kotlin  1.4-M3
#nodejs  14.7.0
#python  3.8.5
#ruby  2.7.1
#rust  1.45.2
