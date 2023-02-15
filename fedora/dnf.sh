# enable common repositories
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y fedora-workstation-repositories
sudo dnf config-manager -y --set-enabled google-chrome

# cleanup
sudo dnf update -y
sudo dnf autoremove -y

# install codecs
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install -y lame\* --exclude=lame-devel
sudo dnf group upgrade -y --with-optional Multimedia --allowerasing
sudo dnf autoremove -y

# install common packages
sudo dnf install -y neofetch
sudo dnf install -y inxi
sudo dnf install -y htop
sudo dnf install -y gnome-tweaks
sudo dnf install -y fish
sudo dnf install -y zsh
sudo dnf install -y zsh-autosuggestions
sudo dnf install -y zsh-syntax-highlighting
sudo dnf config-manager -y --add-repo https://download.opensuse.org/repositories/shells:zsh-users:zsh-history-substring-search/Fedora_Rawhide/shells:zsh-users:zsh-history-substring-search.repo
sudo dnf install -y zsh-history-substring-search
sudo dnf install -y httpie
sudo dnf install -y git
sudo dnf install -y fd-find
sudo dnf install -y fzf
sudo dnf install -y trash-cli
sudo dnf install -y lolcat
sudo dnf install -y fortune-mod

sudo dnf install -y google-chrome-stable

# asdf
rm -rf ~/.asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.1
sudo dnf install -y dnf-plugins-core
sudo dnf builddep -y python3

# zsh-powerline
rm -rf ~/.local/opt/powerlevel10k
mkdir -p ~/.local/opt
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.local/opt/powerlevel10k

# nnn
sudo dnf install -y nnn

# z.lua
rm -rf ~/.local/opt/z.lua
mkdir -p ~/.local/opt
git clone https://github.com/skywind3000/z.lua.git ~/.local/opt/z.lua

# nvim
sudo dnf -y copr enable atim/bottom
sudo dnf install -y bottom
sudo dnf -y copr enable atim/lazygit
sudo dnf install -y lazygit
sudo dnf install -y go
go install github.com/dundee/gdu/v5/cmd/gdu@latest
sudo dnf install -y ripgrep

# vscode
cat <<EOF | sudo tee /etc/yum.repos.d/vscode.repo
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
dnf check-update -y
sudo dnf install -y code

# cleanup
sudo dnf update -y
sudo dnf autoremove -y
