/interface bridge 
add name=lo0 
/interface wireless security-profiles 
set [ find default=yes ] supplicant-identity=MikroTik 
/routing ospf instance 
set [ find default=yes ] router-id=5.5.5.5 
/ip address 
add address=5.5.5.5 interface=lo0 network=5.5.5.5 
add address=10.10.40.2/30 interface=ether3 network=10.10.40.0 
add address=10.10.70.1/30 interface=ether2 network=10.10.70.0 
/mpls ldp 
set enabled=yes transport-address=5.5.5.5 
/mpls ldp interface 
add interface=ether2 
add interface=ether3 
/routing ospf network 
add area=backbone 
/system identity 
set name=RO1.MSK
