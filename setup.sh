sudo apt update
sudo apt -y upgrade
sudo apt install -y vim

sudo apt install -y resolvconf
sudo systemctl start resolvconf.service
sudo systemctl enable resolvconf.service

echo "nameserver 1.1.1.1" | sudo tee /etc/resolvconf/resolv.conf.d/head
echo "nameserver 8.8.8.8" | sudo tee /etc/resolvconf/resolv.conf.d/head
echo "nameserver 8.8.4.4" | sudo tee /etc/resolvconf/resolv.conf.d/head
echo "nameserver 1.0.0.1" | sudo tee /etc/resolvconf/resolv.conf.d/head

sudo systemctl restart resolvconf

echo "[Installing]: Brave Browser"
sudo apt install -y apt-transport-https curl

curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -

echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install -y brave-browser

echo "[]Installing]: Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sudo snap refresh
sudo snap install slack
sudo snap install pycharm-professional
sudo snap install intellij-idea-ultimate
sudo snap install clion
sudo snap install webstorm

