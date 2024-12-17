/interface bridge 
add name=Lo 
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik 
/routing bgp instance 
set default client-to-client-reflection=no router-id=10.0.15.1 
/routing ospf instance 
set [ find default=yes ] router-id=10.0.15.1 
/ip address 
#add address=172.31.255.30/30 interface=ether1 network=172.31.255.28 
add address=10.0.15.1 interface=Lo network=10.0.15.1 
add address=172.40.5.2/30 interface=ether2 network=172.40.5.0 
add address=192.168.10.1/30 interface=ether3 network=192.168.10.0 
#/ip dhcp-client 
#add disabled=no interface=ether1 
/ip route vrf 
add export-route-targets=65530:666 import-route-targets=65530:666 interfaces=ether3 route-distinguisher=65530:666 routing-mark=VRF_DEVOPS 
/mpls ldp 
set enabled=yes 
/mpls ldp interface 
add interface=ether2 
/routing bgp instance vrf 
add redistribute-connected=yes routing-mark=VRF_DEVOPS 
/routing bgp network 
add network=172.40.0.0/16 
/routing bgp peer 
add address-families=ip,l2vpn,l2vpn-cisco,vpnv4 name=peer1 remote-address=10.0.14.1 remote-as=65530 update-source=Lo 
/routing ospf network 
add area=backbone 
/system identity 
set name=RO1.SPB