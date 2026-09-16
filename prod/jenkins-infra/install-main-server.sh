#!/bin/bash
# Run this on the main-server EC2 instance (Amazon Linux 2023).
# This is the server that will actually run your Flask app container.
# Usage: chmod +x install-main-server.sh && ./install-main-server.sh

set -e

echo "=== Updating system packages ==="
sudo dnf update -y

echo "=== Installing Docker ==="
sudo dnf install -y docker
sudo systemctl enable --now docker
sudo usermod -aG docker ec2-user
#sudo dnf install -y docker-compose-plugin
echo "=== Writing .env file for the Flask app ==="
cat > /home/ec2-user/.env << 'ENVEOF'
ENV_NAME=${env_name}
FLASK_DEBUG=${flask_debug}
PORT=${port}
SECRET_KEY=${secret_key}
ENVEOF
chown ec2-user:ec2-user /home/ec2-user/.env
chmod 600 /home/ec2-user/.env

echo ""
echo "================================================="
echo " Done."
echo ""
echo " NOTE: You just got added to the 'docker' group."
echo " Log out and back in (or run 'newgrp docker') before"
echo " running docker commands as ec2-user without sudo."
echo ""
echo " NEXT STEPS:"
echo "   1. Add jenkins-server's SSH public key to ~/.ssh/authorized_keys"
echo "      so Jenkins can deploy here automatically."
echo "   2. Copy .env.example to .env and fill in real values:"
echo "        cp .env.example .env && nano .env"
echo "   3. Make sure port 5000 is open in this instance's security group."
echo "================================================="
