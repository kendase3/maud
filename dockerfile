# <3 sid
from debian:sid

workdir /app

# get whatever apt packages we need
run apt-get update
run apt-get install -y aptitude
run aptitude install -y \
  bison \
  bsdmainutils \
  build-essential \
  flex \
  gdb \
  git \
  ncurses-dev \
  vim

run useradd -ms /bin/bash kewluser
user kewluser
workdir /home/kewluser
run git clone https://github.com/NetHack/NetHack
workdir /home/kewluser/NetHack/sys/unix
run sh setup.sh hints/linux
workdir /home/kewluser/NetHack
run make all
run make install
workdir /home/kewluser/nh/install/games
