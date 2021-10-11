ls /al
setxkbmap pt
sudo dnf in gnome-tweaks gnome-extensions-app
sudo systemctl restart NetworkManager
sudo dnf in gnome-tweaks gnome-extensions-app
dnf se gnome-shell-extens
sudodnf se gnome-shell-extens
sudo dnf se gnome-shell-extens
sudo dnf in gnome-shell-extension-{background-logo,caffeine,frippery-move-clock,gsconnect,no-overview,user-theme}
sudo dnf in p7zip zip unzip unrar
sudo dnf in p7zip zip unzip
sudo dnf install -y rpm-build ttmkfdir
 mkdir -p $HOME/rpmbuild/{RPMS/noarch,BUILD}
echo '_topdir' > ~/.rpmmacros
c Downloads/
ls
cd Downloads/
wget https://gist.githubusercontent.com/ervinb/f5042369a1447fedc804a09d87e60997/raw/msttcorefonts-2.5-1.spec
ls
rpmbuild -bb msttcorefonts-2.5-1.spec 
sudo dnf in cabextract
rpmbuild -bb msttcorefonts-2.5-1.spec 
cd ..
sudo dnf in rpmbuild/RPMS/noarch/msttcorefonts-2.5-1.noarch.rp
sudo dnf in rpmbuild/RPMS/noarch/msttcorefonts-2.5-1.noarch.rpm
dnf in netcat
sudo dnf in netcat
cd Downloads/
wget https://raw.githubusercontent.com/mrbvrz/segoe-ui-linux/master/install.sh
chmod +x install.sh
./install.sh
sudo dnf search fira
sudo dnf in mozilla-fira-*
sudo dnf list installed|grep fira
sudo dnf in alacritty
ls -la
sudo dnf se f34-backgrounds
sudo dnf in f34-backgrounds-{gnome,extras-gnome}
sudo dnf se fira*
nf
dnf in fira-code-font
dnf in fira-code-fonts
sudo dnf in fira-code-fonts
sudo dnf se gnome-shell-extens
sudo dnf in firefox
sudo vim /lib/systemd/system/powertop.service 
git clone https://github.com/M0Rf30/android-udev-rules.git
ls
mv android-udev-rules/ Downloads/
ls
cd Downloads/
ls
cd android-udev-rules/
ls
sudo mv 51-android.rules /etc/udev/rules.d/
sudo chmod 0644 /etc/udev/rules.d/51-android.rules 
sudo groupadd adbusers
sudo usermod -aG adbusers aurocha
sudo systemctl restart systemd-udevd
sudo dnf in pavucontrol
sudo dnf install -y  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf upgrade --refresh
sudo dnf groupupdate core
dnf se plymouth
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser
dnf autoremove -y
sudo dnf autoremove -y
sudo dnf in flatpak
dnf in spotify
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo --user
flatpak update
flatpak install spotify telegram obs 
sudo dnf se plymouth
dnf provides '*bgrt'
sudo dnf in plymouth-theme-spinner
sudo plymouth-set-default-theme -R bgrt
sudo dnf in profile-sync-daemon
systemctl --now --user enable psd
systemctl --user status psd
psd previw
psd preview
systemctl list-unit-files -t service|grep enabled
sudo systemctl --now disable sshd
systemctl list-unit-files --user -t service|grep enabled
systemctl cat sssd
sudo firewall-cmd state
sudo firewall-cmd --state
firewall-conf
sudo firewall-cmd --list-all
sudo firewall-cmd
sudo firewall-cmd --help
sudo firewall-cmd --set-default-zone=home
sudo firewall-cmd --reload
sudo firewall-cmd --zone=public --permanent --add-port=1714-1764/tcp
sudo firewall-cmd --zone=public --permanent --add-port=1714-1764/udp
sudo systemctl restart firewalld
sudo dnf in fish
whereis fish
sudo firewall-cmd --get-default-zone 
sudo firewall-cmd --zone=public --permanent --add-port=1714-1764/tcp
sudo firewall-cmd --zone=home --permanent --add-port=1714-1764/tcp
sudo firewall-cmd --zone=home --permanent --add-port=1714-1764/udp
sudo systemctl --now restart firewalld
ls la
 ls -la
cd Downloads/
ls
tar xpvfz dotfiles.tgz -C ~/
cd
cd .dotfiles/
ls
ls -A
tar xpvfz alacritty.tgz -C ~/
cp .neomuttrc .signature .vimrc .tmux.conf .Xresources ~/
cd
xrdb -merge ~/.Xresources 
cd .config/alacritty/
ls
vim alacritty.yml 
cd
cd .dotfiles/
ls
cd etc/
ls
cd ..
ls
ls -la
vim .bashrc
flatpak install signal
ls -A
ls
flatpak search whatsapp
flatpak install Whatsappqt
sudo dnf in htop
htop
flatpak search reddit
flatpak install giara
flatpak search twitter
htop
sudo dnf in mpv vlc transmission-gtk
sudo dnf autoremove -y
dup
dnf --refresh update
sudo dnf --refresh update
flatpak update
ls -la
ls
dnf list installed|grep software
dnf remove gnome-sotftware
sudo dnf remove gnome-sotftware
sudo dnf remove gnome-sotfware
sudo dnf remove gnome-software
sudo dnf autoremove -y
vim .bashrc
source .bashrc
vim .bashrc
source .bashrc
ls -la
vim .bashrc
source .bashrc
vim .bashrc
source .bashrc
vim .bshrc
vim .bashrc
source .bashrc
ls -la
vim .bashrc
source .bashrc
ls -la
vim .bashrc
source .bashrc
vim .bashrc
source .bashrc
ls -la
vim .bashrc
source .bashrc
ls -la
vim .bashrc
cp .dotfiles/.bash_aliases .
ls -la
source .bashrc 
ls -la
vim .bash_aliases 
ls -la
sudo -i
vim .bashrc
source .bashrc
ls -al
vim .bashrc
source .bashrc
ls -la
vim .bashrc
sudo -i
vim IEFP.txt
ls -la
systemctl list-unit-files -t service|grep enable
sync
dup
cd /etc/
ls
cd profile.d/
ls
dnf list installed|grep freetype
rpm -ql freetype
dnf se freetype
cd
cd Downloads/
ls
sudo vim freetype2.sh 
sudo cp freetype2.sh /etc/profile.d/
export
localectl status
timedatectl
sudo dnf install -y rpmfusion-free-release-tainted
dnf --refresh update
ssh-keygen -t ed25519 -C "fedora-on-latitudeE4570"
cat .ssh/id_ed25519.pub 
sudo vim /etc/profile.d/freetype2.sh 
export
q
ls -la
ls
pfetch 
cd /etc/
ls
cd fonts/
ls
cd conf.d/
ls
sudo ln -sf /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf .
sudo ln -sf /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf .
