/interface bridge 
add name=Lo 
add name=VPLS 
/interface vpls 
add disabled=no l2mtu=1500 mac-address=02:B6:4B:57:21:6F name=VPLS2 remote-peer=10.0.15.1 vpls-id=15:0 
add disabled=no l2mtu=1500 mac-address=02:09:81:DE:76:B4 name=VPLS3 remote-peer=10.0.10.1 vpls-id=15:0 
/interface wireless security-profiles 
set [ find default=yes ] supplicant-identity=MikroTik 
/routing bgp instance 
set default client-to-client-reflection=no router-id=10.0.13.1 
/routing ospf instance 
set [ find default=yes ] router-id=10.0.13.1 
/interface bridge port
add bridge=VPLS interface=VPLS2 
add bridge=VPLS interface=VPLS3 
add bridge=VPLS interface=ether3 
/ip address 
#add address=172.31.255.30/30 interface=ether1 network=172.31.255.28 
add address=10.0.13.1 interface=Lo network=10.0.13.1 
add address=172.40.6.2/30 interface=ether2 network=172.40.6.0 
#/ip dhcp-client 
#add disabled=no interface=ether1 
/mpls ldp 
set enabled=yes 
/mpls ldp interface 
add interface=ether2 
/routing bgp network 
add network=172.40.0.0/16 
/routing bgp peer
add address-families=ip,l2vpn,l2vpn-cisco,vpnv4 name=peer1 remote-address=10.0.12.1 remote-as=65530 update-source=Lo 
/routing ospf network 
add area=backbone 
/system identity 
set name=RO1.SVL