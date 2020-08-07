# Normally I install using git clone https://github.com/asdf-vm/asdf.git ~/.asdf

#sudo apt-get install zip unzip

sudo apt-get update && sudo apt-get dist-upgrade
#Do the following with --install-suggests
sudo apt-get install --install-suggests build-essential gdb

sudo apt-get install -y libssl-dev
sudo apt-get install -y libncurses5-dev

The following additional packages will be installed:
  binutils binutils-common binutils-x86-64-linux-gnu cpp cpp-9 dpkg-dev fakeroot g++ g++-9 gcc gcc-9 gcc-9-base gdbserver libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl libasan5 libatomic1 libbabeltrace1
  libbinutils libc-dev-bin libc6-dbg libc6-dev libcc1-0 libcrypt-dev libctf-nobfd0 libctf0 libdpkg-perl libdw1 libfakeroot libfile-fcntllock-perl libgcc-9-dev libgomp1 libisl22 libitm1 liblsan0 libmpc3 libquadmath0 libstdc++-9-dev
  libtsan0 libubsan1 linux-libc-dev make manpages-dev
Suggested packages:
  binutils-doc cpp-doc gcc-9-locales debian-keyring g++-multilib g++-9-multilib gcc-9-doc gcc-multilib autoconf automake libtool flex bison gcc-doc gcc-9-multilib gdb-doc glibc-doc bzr libstdc++-9-doc make-doc
The following NEW packages will be installed:
  binutils binutils-common binutils-x86-64-linux-gnu build-essential cpp cpp-9 dpkg-dev fakeroot g++ g++-9 gcc gcc-9 gcc-9-base gdb gdbserver libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl libasan5 libatomic1
  libbabeltrace1 libbinutils libc-dev-bin libc6-dbg libc6-dev libcc1-0 libcrypt-dev libctf-nobfd0 libctf0 libdpkg-perl libdw1 libfakeroot libfile-fcntllock-perl libgcc-9-dev libgomp1 libisl22 libitm1 liblsan0 libmpc3 libquadmath0
  libstdc++-9-dev libtsan0 libubsan1 linux-libc-dev make manpages-dev

sudo apt-get install zlib1g-dev



asdf plugin add deno
asdf plugin add elixir
asdf plugin add erlang
asdf plugin add golang
asdf plugin add jq
asdf plugin add kotlin
asdf plugin add nodejs
asdf plugin add python
asdf plugin add ruby
asdf plugin add rust




# For nodejs - I needed to add gpg keys see https://github.com/asdf-vm/asdf-nodejs
# bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
asdf install deno   latest
asdf install elixir latest
asdf install erlang latest
asdf install golang latest
asdf install jq     latest
asdf install kotlin latest
asdf install nodejs latest
asdf install python latest
asdf install ruby   latest
asdf install rust   latest



iles/
cgorshing@DESKTOP-CDS3E69:~/workspaces/dotfiles$ bash asdf-vm.sh
initializing plugin repository...
Cloning into '/home/cgorshing/.asdf/repository'...
remote: Enumerating objects: 108, done.
remote: Counting objects: 100% (108/108), done.
remote: Compressing objects: 100% (78/78), done.
remote: Total 2215 (delta 56), reused 57 (delta 25), pack-reused 2107
Receiving objects: 100% (2215/2215), 515.14 KiB | 2.67 MiB/s, done.
Resolving deltas: 100% (991/991), done.
∗ Downloading and installing deno...
/home/cgorshing/.asdf/plugins/deno/bin/install: line 63: unzip: command not found
Fail: Could not uncompress
Fail: An error occurred
==> Checking whether specified Elixir release exists...
==> Downloading 1.10.4-otp-23 to /tmp/elixir_build_YMqSVA/elixir-precompiled-1.10.4-otp-23.zip
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 5488k  100 5488k    0     0  11.9M      0 --:--:-- --:--:-- --:--:-- 11.9M
==> Copying release into place
ERROR: unzip not found
Downloading kerl...
asdf_23.0.3 is not a kerl-managed Erlang/OTP installation
No build named asdf_23.0.3
Downloading OTP-23.0.3.tar.gz to /home/cgorshing/.asdf/plugins/erlang/kerl-home/archives
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   122  100   122    0     0    426      0 --:--:-- --:--:-- --:--:--   425
100 53.7M    0 53.7M    0     0  8325k      0 --:--:--  0:00:06 --:--:--  9.8M
Extracting source code
Building Erlang/OTP 23.0.3 (asdf_23.0.3), please wait...
WARNING: It appears that a required development package 'libssl-dev' is not installed.
WARNING: It appears that a required development package 'make' is not installed.
WARNING: It appears that a required development package 'automake' is not installed.
WARNING: It appears that a required development package 'autoconf' is not installed.
WARNING: It appears that a required development package 'libncurses5-dev' is not installed.
WARNING: It appears that a required development package 'gcc' is not installed.
Configure failed.


=== running autoconf in lib/common_test
./otp_build: 234: autoconf: not found
/home/cgorshing/.asdf/plugins/erlang/kerl: 904: make: not found
Building linux binary; if you intended to cross build for win32 use
   eval `./otp_build env_win32`

/home/cgorshing/.asdf/plugins/erlang/kerl-home/builds/asdf_23.0.3/otp_src_23.0.3/configure  --cache-file=/dev/null
./otp_build: 262: ./configure: not found

Please see /home/cgorshing/.asdf/plugins/erlang/kerl-home/builds/asdf_23.0.3/otp_build_23.0.3.log for full details.
Platform 'linux' supported!
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  6  118M    6 7455k    0     0  13.2M      0  0:00:08 --:--:--  0:00:08 13.1M^C
received sigint, cleaning up
^C
















