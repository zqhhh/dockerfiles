#!/bin.bash
cd /etc/apt
[ -f "sources.list.bak" ] || cp sources.list sources.list.bak &&  \
    cat <<EOF > sources.list
deb http://mirrors.163.com/debian/ buster main contrib non-free
deb http://mirrors.163.com/debian/ buster-updates main contrib non-free
deb http://mirrors.163.com/debian/ buster-backports main contrib non-free
deb http://mirrors.163.com/debian-security buster/updates main contrib non-free
EOF
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
apt-get update &&  \
    apt-get install -y -q apt-utils curl wget jq vim net-tools lsof git-lfs subversion g++ && \
    rm  -rf /usr/lib/code-server/src/browser/media/favicon.svg && \
    rm  -rf /usr/lib/code-server/src/browser/media/*.png && \
    cp /myinit/favicon.ico /usr/lib/code-server/src/browser/media/
