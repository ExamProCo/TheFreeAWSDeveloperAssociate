#!/usr/bin/env bash
su ec2-user
sudo yum install httpd -y
sudo service httpd start
sudo su -c "cat > /var/www/html/index.html <<EOL
<html>
  <head>
    <title>Call to Arms</title>
    <style>
      html, body { background: #000; padding: 0; margin: 0; }
      img {display: block; margin: 0px auto; }
    </style>
  </head>
  <body>
    <img src='https://media.giphy.com/media/xIytx7kHpq74c/giphy.gif' height='100%'/>
  </body>
</html>
EOL"