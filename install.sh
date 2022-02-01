# Install Pre-requisits
apt update
apt install -y apt-utils curl git gnupg htop locales-all nano zip wget

# Setup Azul repository
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9
wget https://cdn.azul.com/zulu/bin/zulu-repo_1.0.0-3_all.deb
apt install -y ./zulu-repo_1.0.0-3_all.deb

# Download and install Java17
apt update
apt install -y zulu17-jdk-headless

# Create minecraft server folder
mkdir -p /opt/minecraft/server

# Create spigot folder
mkdir /opt/spigot

# Create minecraft user and set folder permissions
useradd -r minecraft -s /bin/false
chown -R minecraft:minecraft /opt/minecraft/server

# Copy start.sh to /opt/minecraft/server
cp opt/minecraft/server/start.sh /opt/minecraft/server/start.sh

# Copy minecraft-server.service to /etc/systemd/system
cp etc/systemd/system/minecraft-server.service /etc/systemd/system/minecraft-server.service

# Build Spigot 1.18.1
cd /opt/spigot
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
java -jar BuildTools.jar

# Copy Spigot 1.18.1 to /opt/minecraft/server
cp /opt/spigot/spigot-1.18.1.jar /opt/minecraft/server/

# Setup minecraft-server.service
systemctl daemon-reload
systemctl enable minecraft-server
systemctl start minecraft-server