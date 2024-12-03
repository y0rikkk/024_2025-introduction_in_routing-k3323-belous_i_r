/interface bridge 
add name=lo0 
/interface wireless security-profiles 
set [ find default=yes ] supplicant-identity=MikroTik 
/routing ospf instance 
set [ find default=yes ] router-id=4.4.4.4
/ip address
add address=4.4.4.4 interface=lo0 network=4.4.4.4
add address=10.10.30.2/30 interface=ether2 network=10.10.30.0 
add address=10.10.60.1/30 interface=ether3 network=10.10.60.0 
add address=10.10.50.1/30 interface=ether4 network=10.10.50.0 
/mpls ldp 
set enabled=yes transport-address=4.4.4.4
/mpls ldp interface 
add interface=ether2 
add interface=ether3 
add interface=ether4 
/routing ospf network 
add area=backbone 
/system identity 
set name=RO1.HKI
