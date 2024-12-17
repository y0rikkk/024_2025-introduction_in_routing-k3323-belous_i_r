/interface bridge 
add name=Lo 
add name=VPLS 
/interface vpls 
add disabled=no l2mtu=1500 mac-address=02:94:C1:74:C4:F4 name=VPLS1 remote-peer=10.0.15.1 vpls-id=15:0 
add disabled=no l2mtu=1500 mac-address=02:63:CB:A8:53:08 name=VPLS3 remote-peer=10.0.13.1 vpls-id=15:0 
/interface wireless security-profiles 
set [ find default=yes ] supplicant-identity=MikroTik 
/routing bgp instance 
set default client-to-client-reflection=no router-id=10.0.10.1 
/routing ospf instance 
set [ find default=yes ] router-id=10.0.10.1 
/interface bridge port 
add bridge=VPLS interface=VPLS1 
add bridge=VPLS interface=VPLS3
add bridge=VPLS interface=ether2 
/ip address 
#add address=172.31.255.30/30 interface=ether1 network=172.31.255.28 
add address=10.0.10.1 interface=Lo network=10.0.10.1 
add address=172.40.1.1/30 interface=ether3 network=172.40.1.0 
#/ip dhcp-client 
#add disabled=no interface=ether1 
/mpls ldp 
set enabled=yes 
/mpls ldp interface 
add interface=ether3 
/routing bgp network 
add network=172.40.0.0/16 
/routing bgp peer 
add address-families=ip,l2vpn,l2vpn-cisco,vpnv4 name=peer1 remote-address=10.0.11.1 remote-as=65530 update-source=Lo 
/routing ospf network 
add area=backbone 
/system identity 
set name=RO1.NY