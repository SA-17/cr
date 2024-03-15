#!/bin/bash

sudo apt install privoxy
sudo echo '' >> /etc/privoxy/config
sudo echo 'listen-address 192.89.2.3:8118' >> /etc/privoxy/config
sudo echo 'accept-intercepted-requests 1' >> /etc/privoxy/config
sudo service privoxy start
sudo update-rc.d privoxy defaults
iptables -t nat -A PREROUTING -s 5.5.0.0/16 -p tcp -m multiport --dports 80,8080,81 -j DNAT --to-destination 192.89.2.3:8118


