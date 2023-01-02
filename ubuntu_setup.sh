sudo apt update
sudo apt -y upgrade

echo "[Setup]: Setup DNS - Cloudflare & Google"
sudo apt install -y resolvconf
sudo systemctl start resolvconf.service
sudo systemctl enable resolvconf.service

echo "nameserver 1.1.1.1" | sudo tee /etc/resolvconf/resolv.conf.d/head
echo "nameserver 8.8.8.8" | sudo tee /etc/resolvconf/resolv.conf.d/head
echo "nameserver 8.8.4.4" | sudo tee /etc/resolvconf/resolv.conf.d/head
echo "nameserver 1.0.0.1" | sudo tee /etc/resolvconf/resolv.conf.d/head

sudo systemctl restart resolvconf


echo "[Installing]: something"
sudo apt install -y git \
    gcc \
    neovim \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    gnupg-agent \
    lsb-release \
    software-properties-common \
    snapd


echo "[Installing]: Brave Browser"
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser


echo "[Installing]: Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


echo "[Installing]: Node"
sudo apt install -y node


echo "[Installing]: C#"
wget https://packages.microsoft.com/config/ubuntu/22.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-7.0


echo "[Installing]: GoLang"
wget https://dl.google.com/go/go1.19.4.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.4.linux-amd64.tar.gz


echo "[Installing]: Docker"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo usermod -ag docker eurus


echo "[Installing]: Anaconda3"
sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
wget https://repo.anaconda.com/archive/Anaconda3-2022.10-Linux-x86_64.sh
./Anaconda3-2022.10-Linux-x86_64.sh
conda config --set changeps1 False


echo "[Installing]: Slack"
sudo snap install slack --classic

