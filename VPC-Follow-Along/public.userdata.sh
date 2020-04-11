 
#!/usr/bin/env bash
su ec2-user
sudo yum install httpd -y
sudo service httpd start
sudo su -c "cat > /var/www/html/index.html <<EOL
<html>
  <head>
    <title>My WebApp</title>
  </head>
  <body>
     <h1>My WebApp</h1>
  </body>
</html>
EOL"
