These are some simple things to get establish a baseline. I have more things in Ansible

I don't use this on every machine, but for a VM that is running in VMWare on my laptop, then I turned off the password prompt
if [ -z "$(sudo grep 'cgorshing' /etc/sudoers )" ]; then echo "cgorshing ALL=(ALL) NOPASSWD:ALL # Run all commands w/out a password prompt" | sudo EDITOR='tee -a' visudo; fi;

sudo apt install locales

# Uncomment en_US.UTF-8 for inclusion in generation
sudo sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen && sudo locale-gen

# NOTE! I have seen others where the locale-gen is passed arguments ... does this work?
locale-gen "en_US.UTF-8"
locale-gen en_US en_US.UTF-8


Restart then continue with the rest of the script



# TODO On MacOS, most/all of these are managed by Brewfile. Need to reconcile
# this a bit more with homebrew and maybe have it in one spot

sudo apt install -y                          make zlib1g-dev liblzma-dev
# sudo apt-get install --no-install-recommends  wget curl llvm xz-utils tk-dev libxml2-dev libxmlsec1-dev



# NOTE Just use the OS package manager for jq
# ASDF Seems to have some issues with what git repo to use for jq - I've seen 3 different ones
# The asdf-vm default jq plugin (from focused labs) works fine on macos but is broken for linux, using another one
# asdf plugin add jq https://github.com/AZMCode/asdf-jq.git # Update 2023-01-08 This is still accurate https://github.com/asdf-vm/asdf-plugins
# asdf plugin update jq patch-1 # 2023-01-08 Don't think this is needed anymore. Not using it on the WSL instances anymore





# Need to figure out what we need for bootstrap purposes and leave the rest to Ansible.
# I'd rather not 100% duplicate this in Ansible, but wouldn't be the end of the world.
# Oh - I use this array so I can use comments inline
args=(
  curl
  vim
  wget
  zip

  build-essential
  autoconf
  automake
  inotify-tools # for phoenix live-reload
  libbz2-dev
  libffi-dev     # to prevent this when installing python (w/ASDF) and Ansible WARNING: The Python ctypes extension was not compiled. Missing the libffi lib
  liblzma-dev
  libncurses5-dev
  libreadline8
  libreadline-dev
  libsqlite3-dev
  libssl-dev
  libxml2-dev
  libyaml-dev  # needed for ruby
  sqlite3      # for asdf install python (some python packages need it)
  zlib1g
  zlib1g-dev
)
sudo apt-get update && sudo apt install -y "${args[@]}" && sudo apt-get -y dist-upgrade && sudo shutdown -r now


# I don't remember why I needed "llvm"
# sudo apt-get install --no-install-recommends make llvm xz-utils tk-dev libxmlsec1-dev

wget asdf-vm
Move the binary to ~/.asdf/bin


# I am playing around with bash-builtins - don't know if this is valuable yet for me or not, but might be something worth adding to provisioning.

# I now run postgres in podman
# sudo apt install -y postgresql postgresql-contrib

# NOTE Just use the OS package manager for jq
# ASDF Seems to have some issues with what git repo to use for jq - I've seen 3 different ones
# The asdf-vm default jq plugin (from focused labs) works fine on macos but is broken for linux, using another one
# asdf plugin add jq https://github.com/AZMCode/asdf-jq.git # Update 2023-01-08 This is still accurate https://github.com/asdf-vm/asdf-plugins
# asdf plugin update jq patch-1 # 2023-01-08 Don't think this is needed anymore. Not using it on the WSL instances anymore

# For nodejs - I needed to add gpg keys see https://github.com/asdf-vm/asdf-nodejs
# bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
asdf plugin add python
asdf plugin add erlang
asdf plugin add elixir
asdf plugin add nodejs

asdf plugin add ruby # Needed for jekyll primarily - I use Ruby 3.3 because that is what the github-pages gem uses 
https://github.com/github/pages-gem/blob/master/.ruby-version

asdf plugin add golang
asdf plugin add rust
asdf plugin add zig

# asdf plugin add deno
# asdf plugin add kotlin

Now move to settings up dotfiles and Ansible


### WSL
I haven't set up a new WSL instance in a while. So these notes are rough and not to be fully followed.

Just jotting this down so I have a starting point

I don't know if this is still needed anymore. But used to be some differences/changes needed for path to work
Mainly keeping "code ." working while in a WSL instance.
/etc/wsl.conf -> appendWindowsPath

myUsername=<what ever you want>
adduser -G wheel $myUsername
echo -e "[user]\ndefault=$myUsername" >> /etc/wsl.conf
passwd $myUsername

rsync -av --chmod=Du=rwx,Dg=,Do=,Fu=r,Fg=,Fo= /mnt/c/Users/<username>/.ssh/ ~/.ssh/
ln -s /mnt/c/Users/<username>/workspaces ~/workspaces

Neovim
python -m pip install pyright
~/tools/elixir-ls-built/
~/tools/lua-language-server-3.13.5-linux-x64/bin
~/tools/nvim-linux-x86_64/bin
