/interface bridge 
add name=Lo 
/interface wireless security-profiles 
set [ find default=yes ] supplicant-identity=MikroTik 
/routing bgp instance 
set default router-id=10.0.12.1 
/routing ospf instance 
set [ find default=yes ] router-id=10.0.12.1 
/ip address
#add address=172.31.255.30/30 interface=ether1 network=172.31.255.28 
add address=10.0.12.1 interface=Lo network=10.0.12.1 
add address=172.40.3.2/30 interface=ether2 network=172.40.3.0 
add address=172.40.4.2/30 interface=ether3 network=172.40.4.0 
add address=172.40.6.1/30 interface=ether4 network=172.40.6.0 
#/ip dhcp-client 
#add disabled=no interface=ether1 
/mpls ldp 
set enabled=yes 
/mpls ldp interface 
add interface=ether2 
add interface=ether4 
add interface=ether3 
/routing bgp network
add network=172.40.0.0/16 
/routing bgp peer 
add address-families=ip,l2vpn,l2vpn-cisco,vpnv4 name=peer1 remote-address=10.0.11.1 remote-as=65530 route-reflect=yes update-source=Lo 
add address-families=ip,l2vpn,l2vpn-cisco,vpnv4 name=peer2 remote-address=10.0.13.1 remote-as=65530 update-source=Lo 
add address-families=ip,l2vpn,l2vpn-cisco,vpnv4 name=peer3 remote-address=10.0.14.1 remote-as=65530 route-reflect=yes update-source=Lo 
/routing ospf network 
add area=backbone 
/system identity 
set name=RO1.LBN