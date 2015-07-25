echo 1 > /proc/sys/net/ipv4/ip_forward
echo 1 > /proc/sys/net/ipv4/conf/eth0/proxy_arp
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

