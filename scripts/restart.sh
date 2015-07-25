./unstack.sh
sudo service rabbitmq-server restart
sudo service mysql restart
sudo service openvswitch-switch restart
sudo a2ensite keystone
sudo service apache2 restart
./rejoin-stack.sh

sudo ovs-vsctl -- --may-exist add-br br-ex
sudo ovs-vsctl br-set-external-id br-ex bridge-id br-ex
sudo ip addr flush dev br-ex
sudo ovs-vsctl set Bridge br-ex other_config:disable-in-band=true
sudo ip addr add 172.24.4.1/24 dev br-ex
sudo ip link set br-ex up
sudo route add -net 10.0.0.0/24 gw 172.24.4.2

