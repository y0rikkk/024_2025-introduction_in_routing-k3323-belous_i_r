/interface bridge 
add name=EoMPLS 
add name=lo0 
/interface vpls 
add cisco-style=yes cisco-style-id=100 disabled=no l2mtu=1500 name=EoMPLS_vpls remote-peer=1.1.1.1 
/interface wireless security-profiles 
set [ find default=yes ] supplicant-identity=MikroTik 
/routing ospf instance 
set [ find default=yes ] router-id=6.6.6.6
/interface bridge port 
add bridge=EoMPLS interface=ether4 
add bridge=EoMPLS interface=EoMPLS_vpls 
/ip address 
add address=6.6.6.6 interface=lo0 network=6.6.6.6
add address=10.10.70.2/30 interface=ether2 network=10.10.70.0 
add address=10.10.60.2/30 interface=ether3 network=10.10.60.0 
/mpls ldp 
set enabled=yes transport-address=6.6.6.6
/mpls ldp interface 
add interface=ether2 
add interface=ether3 
/routing ospf network 
add area=backbone 
/system identity 
set name=RO1.SPB
