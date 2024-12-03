/interface bridge 
add name=lo0 
/interface wireless security-profiles 
set [ find default=yes ] supplicant-identity=MikroTik 
/routing ospf instance 
set [ find default=yes ] router-id=2.2.2.2 
/ip address 
add address=2.2.2.2 interface=lo0 network=2.2.2.2 
add address=10.10.10.2/30 interface=ether2 network=10.10.10.0 
add address=10.10.30.2/30 interface=ether3 network=10.10.30.0 
/mpls ldp 
set enabled=yes transport-address=2.2.2.2 
/mpls ldp interface 
add interface=ether2 
add interface=ether3 
/routing ospf network 
add area=backbone 
/system identity 
set name=RO1.LND
