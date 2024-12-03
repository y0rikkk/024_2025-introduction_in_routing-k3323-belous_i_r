/interface wireless security-profiles 
set [ find default=yes ] supplicant-identity=MikroTik 
/ip address 
add address=192.168.10.12/24 interface=ether2 network=192.168.10.0 
/system identity 
set name=PC1
