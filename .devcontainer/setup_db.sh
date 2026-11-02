#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

echo "Installing PostgreSQL client..."
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -yq postgresql-client

echo "Client installed successfully! You can now use 'psql' in the terminal."

echo "Configuring default psql connection settings..."
echo 'export PGHOST=localhost' >> ~/.bashrc
echo 'export PGPORT=5432' >> ~/.bashrc
echo 'export PGUSER=admin' >> ~/.bashrc
echo 'export PGPASSWORD=LeaguePassword2026' >> ~/.bashrc
echo 'export PGDATABASE=sports_db' >> ~/.bashrc

# Pre-configure upstream remote so 'git pull upstream main' works seamlessly on exam day
git remote add upstream https://github.com/COS313-2026/Template_exam2_repository.git 2>/dev/null || true

# Block Copilot endpoints at container level
echo "127.0.0.1 api.githubcopilot.com" | sudo tee -a /etc/hosts > /dev/null || true
echo "127.0.0.1 copilot-proxy.githubusercontent.com" | sudo tee -a /etc/hosts > /dev/null || true
