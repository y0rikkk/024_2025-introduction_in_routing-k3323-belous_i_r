/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik 
/ip address 
#add address=172.31.255.30/30 interface=ether1 network=172.31.255.28 
add address=172.40.40.2/24 interface=ether2 network=172.40.40.0 
#/ip dhcp-client 
#add disabled=no interface=ether1 
/system identity 
set name=PC2