from ubuntu:latest

run apt update -y && apt-get install bash gcc-avr binutils-avr \
    avr-libc avrdude gcc git make -y
run git clone https://github.com/vlang/v.git /opt/v
run cd /opt/v; make -j;./v symlink

# Bash
cmd ["/bin/bash"]