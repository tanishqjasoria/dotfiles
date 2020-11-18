sudo apt update
sudo apt -y upgrade
sudo apt install -y vim git gcc code nvim 

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

sudo apt install -y node

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo usermod -ag docker eurus

sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
wget https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh
./Anaconda3-2020.07-Linux-x86_64.sh

sudo snap refresh
sudo snap install spotify
sudo snap install slack --classic
sudo snap install pycharm-professional --classic
sudo snap install intellij-idea-ultimate --classic
sudo snap install clion --classic
sudo snap install webstorm --classic

