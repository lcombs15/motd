#!/bin/zsh

MOTD=/etc/update-motd.d

function link () {
    source=$1
    dest=$MOTD/$source
    echo source $source
    echo dest $dest
    sudo rm -f $dest
    sudo ln -sf $(pwd)/$source $dest
}

function disable () {
    sudo chmod -x $MOTD/$1
}


link 10-hostname-color
link 20-sysinfo
link 20-uptime
link 35-diskspace
link 60-docker

disable 10-help-text
disable 50-motd-news
disable 50-landscape-sysinfo
