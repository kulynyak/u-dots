# ssh
sudo firewall-cmd --zone=public --permanent --add-service=ssh
sudo firewall-cmd --reload
sudo systemctl enable sshd
sudo systemctl start sshd
sudo systemctl status sshd

# other