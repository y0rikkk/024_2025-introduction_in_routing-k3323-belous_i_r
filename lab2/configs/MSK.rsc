/interface wireless security-profiles 
set [ find default=yes ] supplicant-identity=MikroTik 
/ip pool 
add name=pool1 ranges=192.168.10.10-192.168.10.254 
/ip dhcp-server 
add address-pool=pool1 disabled=no interface=ether4 name=dhcp1 
/ip address 
#add address=172.31.255.30/30 interface=ether1 network=172.31.255.28 
add address=10.10.1.1/30 interface=ether2 network=10.10.1.0 
add address=10.10.2.1/30 interface=ether3 network=10.10.2.0 
add address=192.168.10.1/24 interface=ether4 network=192.168.10.0
/ip route
add distance=1 dst-address=192.168.20.0/24 gateway=10.10.2.2
add distance=1 dst-address=192.168.30.0/24 gateway=10.10.1.2
#/ip dhcp-client
#add disabled=no interface=ether1 
/system identity
set name=R01.MSK
