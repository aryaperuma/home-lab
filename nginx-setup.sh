#!/bin/bash

# Install NGINX
sudo apt update
sudo apt install -y nginx

# Enable and start NGINX
sudo systemctl enable nginx
sudo systemctl start nginx

# Configure a simple HTML page
echo "<html>
<head>
    <title>Home Lab Monitoring</title>
</head>
<body>
    <h1>Welcome to Home Lab Monitoring!</h1>
</body>
</html>" | sudo tee /var/www/html/index.html

# Restart NGINX
sudo systemctl restart nginx
