/interface bridge 
add name=EoMPLS 
add name=lo0 
/interface vpls 
add cisco-style=yes cisco-style-id=100 disabled=no l2mtu=1500 name=EoMPLS_vpls remote-peer=6.6.6.6
/interface wireless security-profiles 
set [ find default=yes ] supplicant-identity=MikroTik 
/routing ospf instance 
set [ find default=yes ] router-id=1.1.1.1 
/interface bridge port 
add bridge=EoMPLS interface=ether2 
add bridge=EoMPLS interface=EoMPLS_vpls 
/ip address
add address=10.10.10.1/30 interface=ether3 network=10.10.10.0 
add address=10.10.20.1/30 interface=ether4 network=10.10.20.0 
add address=1.1.1.1 interface=lo0 network=1.1.1.1 
/mpls ldp 
set enabled=yes transport-address=1.1.1.1 
/mpls ldp interface 
add interface=ether3 
add interface=ether4 
/routing ospf network 
add area=backbone 
/system identity 
set name=RO1.NY
