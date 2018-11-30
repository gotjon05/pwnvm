#!/bin/bash

# fix
echo "set grub-pc/install_devices /dev/sda" | sudo debconf-communicate

# Updates
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get -y install python3-pip
sudo apt-get -y install gdb gdb-multiarch
sudo apt-get -y install unzip
sudo apt-get -y install build-essential
sudo apt-get -y install unrar
sudo apt-get -y install htop
sudo apt-get -y install tmux 

# QEMU with MIPS/ARM - http://reverseengineering.stackexchange.com/questions/8829/cross-debugging-for-mips-elf-with-qemu-toolchain
sudo apt-get -y install qemu qemu-user qemu-user-static
sudo apt-get -y install 'binfmt*'
sudo apt-get -y install libc6-armhf-armel-cross
sudo apt-get -y install debian-keyring
sudo apt-get -y install debian-archive-keyring
sudo apt-get -y install emdebian-archive-keyring
tee /etc/apt/sources.list.d/emdebian.list << EOF
deb http://mirrors.mit.edu/debian squeeze main
deb http://www.emdebian.org/debian squeeze main
EOF
sudo apt-get -y install libc6-mipsel-cross
sudo apt-get -y install libc6-arm-cross
mkdir /etc/qemu-binfmt
ln -s /usr/mipsel-linux-gnu /etc/qemu-binfmt/mipsel
ln -s /usr/arm-linux-gnueabihf /etc/qemu-binfmt/arm

# These are so the 64 bit vm can build 32 bit
sudo apt-get -y install libx32gcc-4.8-dev
sudo apt-get -y install libc6-dev-i386

# Install Pwntools
sudo apt-get -y install python2.7 python-pip python-dev git libssl-dev libffi-dev build-essential
sudo pip install --upgrade pip
#if "--upgrade" is not included in the command, already installed python packages are left alone.
sudo pip install pwntools

#Other Pip Libraries
sudo pip install --upgrade xtract
cd


/*
#go
#sudo -H mkdir -p ~/bin/gocode
#cd ~/bin/gocode 
#echo 'export GOPATH=/home/vagrant/bin/gocode' >> /home/vagrant/.zshrc
#echo 'export PATH=$PATH:/home/vagrant/bin/gocode' >> /home/vagrant/.zshrc
#echo "source ~/.zshrc" >> /home/vagrant/.zshrc
#sudo -H apt-get -y install golang-go
#sudo -H go get github.com/bnagy/cgasm
#cd


mkdir tools
cd tools

# Capstone for pwndbg
#git clone https://github.com/aquynh/capstone
#pushd capstone
#git checkout -t origin/next
#sudo ./make.sh install
#cd bindings/python
#sudo python3 setup.py install # Ubuntu 14.04+, GDB uses Python3
#popd

# pycparser for pwndbg
#sudo pip3 install pycparser # Use pip3 for Python3

# Install radare2
git clone https://github.com/radare/radare2
pushd radare2
./sys/install.sh
popd

# Install binwalk
git clone https://github.com/devttys0/binwalk
pushd binwalk
sudo python setup.py install
popd


# Install Angr
sudo apt-get -y install python-dev libffi-dev build-essential virtualenvwrapper
sudo pip -I install virtualenv
virtualenv angr
source angr/bin/activate
pip -I install angr --upgrade
deactivate

# oh-my-zsh
sudo apt-get -y install zsh
echo vagrant | sh -c "$(wget -nc https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"



#wget https://github.com/tmux/tmux/releases/download/2.5/tmux-2.5.tar.gz
#tar -zxvf tmux-2.5.tar.gz
#pushd tmux-2.5
#sudo apt-get -y install libevent-dev
#sudo apt-get -y install libncurses-dev
#./configure && make && sudo make install
#popd
#rm -rf tmux-2.5.tar.gz
#rm -rf tmux-2.5

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install


## GDB Tools
# Install peda
#git clone https://github.com/longld/peda.git
# Install pwndbg
#git clone https://github.com/zachriggle/pwndbg
# Install gef
#git clone https://github.com/hugsy/gef.git
# Install voltron
#git clone https://github.com/snare/voltron.git
#pushd voltron
#./install.sh
#popd

# fixenv
#wget https://raw.githubusercontent.com/hellman/fixenv/master/r.sh
#mv r.sh fixenv
#chmod +x fixenv

# AFL Fuzzer
wget -nc http://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz
tar -zxvf afl-latest.tgz
pushd afl-*
make && sudo make install
popd
rm afl-latest.tgz

# Enable 32bit binaries on 64bit host
sudo dpkg --add-architecture i386
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install libc6:i386 libc6-dbg:i386 libncurses5:i386 libstdc++6:i386

# Install z3 theorem prover
git clone https://github.com/Z3Prover/z3.git && cd z3
python scripts/mk_make.py --python
cd build; make && sudo make install
cd

#Create current_progress
mkdir -p current_progress
mkdir -p current_progress/ctf
mkdir -p current_progress/wargame_jonathan
cd

# Put challenges on the box
mkdir -p wargames
mkdir -p wargames/computer_systems/bomb_lab
mkdir -p wargames/modern_binary_exploitation
cd


cd wargames/computer_systems/bomb_lab
wget -nc http://csapp.cs.cmu.edu/3e/bomb.tar
tar -xvf bomb.tar
rm -rf bomb.tar
wget -nc http://csapp.cs.cmu.edu/3e/README-bomblab
cd

cd wargames/modern_binary_exploitation
wget -nc https://github.com/RPISEC/MBE/releases/download/v1.1_release/MBE_release.tar.gz
tar -xvzf MBE_release.tar.gz
rm -rf MBE_release.tar.gz
cd


# tweak dotfiles
sed -i 's/robbyrussell/refined/g' /home/vagrant/.zshrc
echo "alias ls='ls -l --color=auto'" >> /home/vagrant/.zshrc
