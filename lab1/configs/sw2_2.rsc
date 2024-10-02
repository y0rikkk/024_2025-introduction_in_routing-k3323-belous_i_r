/interface bridge
add name=bridge2 vlan-filtering=yes
/interface vlan
add interface=ether2 name=vlan20 vlan-id=20
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/interface bridge port
add bridge=bridge2 interface=vlan20
add bridge=bridge2 interface=ether3
#/ip address
#add address=172.31.255.30/30 interface=ether1 network=172.31.255.28
/ip dhcp-client
#add disabled=no interface=ether1
add disabled=no interface=bridge2
/system identity
set name=sw02_2
