#!/usr/bin/env bash
sudo dnf install -y snapd
sudo ln -sfn /var/lib/snapd/snap /snap
sudo systemctl daemon-reload
sudo systemctl enable snapd
sudo systemctl start snapd
