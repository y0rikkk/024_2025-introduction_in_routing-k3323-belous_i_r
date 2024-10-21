/interface wireless security-profiles 
set [ find default=yes ] supplicant-identity=MikroTik 
/ip pool 
add name=pool2 ranges=192.168.20.10-192.168.20.254 
/ip dhcp-server 
add address-pool=pool2 disabled=no interface=ether4 name=dhcp2
/ip address 
#add address=172.31.255.30/30 interface=ether1 network=172.31.255.28 
add address=10.10.2.2/30 interface=ether3 network=10.10.2.0 
add address=10.10.3.1/30 interface=ether2 network=10.10.3.0 
add address=192.168.20.1/24 interface=ether4 network=192.168.20.0
/ip route
add distance=1 dst-address=192.168.10.0/24 gateway=10.10.2.1 
add distance=1 dst-address=192.168.30.0/24 gateway=10.10.3.2
#/ip dhcp-client
#add disabled=no interface=ether1 
/system identity
set name=R01.FRT
