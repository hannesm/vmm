#!/bin/sh
ALBATROSS_USER=albatross

sudo mkdir -m 0700 -p /var/lib/albatross/block
sudo install -o "$ALBATROSS_USER" -- /dev/null /var/lib/albatross/albatross.log

sudo cp ../../_build/install/default/bin/* /usr/local/sbin/
sudo cp ./albatross_*.service ./albatross_*.socket /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl stop albatross_console
sudo systemctl start albatross_console
sudo systemctl stop albatross_log
sudo systemctl start albatross_log
sudo systemctl stop albatross_daemon
sudo systemctl start albatross_daemon
