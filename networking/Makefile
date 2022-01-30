list-protocols:
	cat /etc/protocols

list-ports-by-services:
	less /etc/services

disp-network-config:
	cat /etc/network/interfaces

turn-on-off-interface:
	# ifdown eth0
	# ifup eth0
	#
	# # OLD WAY
	# # ifconfig can be used to turn off interface
	# # but it will not use updated configuration
	# ifconfig eth0 down
	# ifconfig eth0 up
	# # MODERN WAY
	# ip link set eth0 down
	# ip link set eth0 up

list-interfaces:
	ip a	

list-interfaces-ipv4:
	ip -4 a

list-interface-ipv6:
	ip -6 a

list-wifi-interface:
	ip a show wlp1s0

whatismy-ip-address:
	ip -4 a show wlp1s0 | grep inet

hint_networking:
	# http://tldp.org/LDP/nag2/index.html
	# ping, traceroute, ip, netstat, ftp, sftp, wget, ssh, scp
	ping -c 1 linuxcommand.org
	# tracepath slashdot.org
	# wget http://linuxcommand.org/index.php
	ssh -V
	# Let’s say we are sitting at a Linux system called lin-
	# uxbox that is running an X server, and we want to run the xload program on a
	# remote system named remote-sys to see the program’s graphical output on our
	# local system. We could do this:
	# ssh -X remote-sys
	# xload
	#
	# scp bob@remote-sys:document.txt .
	#
	# An SSH Client for Windows?
	# PuTTY is available at http://www.chiark.greenend.org.uk/~sgtatham/putty/

ubuntu-update-hostname:
	# sudo hostnamectl set-hostname myhostname
	#
	# The following change hostname but not permanently
	# hostname myhostname
	#
	# sysctl kernel.hostname=myhostname

whatismy-hostname:
	hostname
	# cat /etc/hostname

whatismy-dnsdomainname:
	dnsdomainname

whatismy-fqdn:
	hostname --fqdn

display-network-hw:
	sudo lshw -C network

whatismy-mac-address:
	sudo lshw -C network | grep serial
	# ip a show wlp1s0 | grep ether

display-recently-communicated-devices:
	arp -a

kernel-network-interface:
	netstat -ie
	
kernel-routing-table:
	netstat -r


hint_tcpdump:
	# tcpdump host 192.168.1.38
	# tcpdump tcp port 22
	# tcpdump -w sshdump.tcpdump tcp port 22
	# tcpdump -r sshdump.tcpdump

display-nameserver:
	cat /etc/resolv.conf
	systemd-resolve --status

ipforwarding-status:
	cat /proc/sys/net/ipv4/ip_forward

ipforwarding-config-default:
	grep ip_forward /etc/sysctl.conf

ipforwarding-sysctl:
	sysctl -a 2>/dev/null | grep ip_forward

iptable-filtertable:
	sudo iptables -t filter -L
	# sudo iptables -L

iptable-nat-table:
	sudo iptables -t nat -L
