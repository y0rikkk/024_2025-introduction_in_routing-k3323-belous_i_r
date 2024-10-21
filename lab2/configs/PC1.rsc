/interface wireless security-profiles
 set [ find default=yes ] supplicant-identity=MikroTik 
 #/ip address 
 #add address=172.31.255.30/30 interface=ether1 network=172.31.255.28 
 /ip dhcp-client
 #add disabled=no interface=ether1 
 add disabled=no interface=ether2 
 /ip route 
 add distance=1 dst-address=10.10.1.0/30 gateway=192.168.10.1 
 add distance=1 dst-address=10.10.2.0/30 gateway=192.168.10.1 
 add distance=1 dst-address=192.168.20.0/24 gateway=192.168.10.1 
 add distance=1 dst-address=192.168.30.0/24 gateway=192.168.10.1 
 /system identity 
 set name=PC1
