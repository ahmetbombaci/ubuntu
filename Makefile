list-installed-repos:
	sudo grep -rhE ^deb /etc/apt/sources.list*
	sudo apt-cache policy
	# cat /etc/apt/sources.list
	# ls /etc/apt/sources.list.d/

list-installed-apps:
	snap list
	sudo apt list
	pip3 list

list-installed-app-names:
	grep -R "Name=" ~/.local/share/applications
	grep -R "Name=" /usr/share/applications

list-environment-variables:
	cat /etc/environment

display-ubuntu-version:
	cat /etc/os-release
	cat /proc/version
	lsb_release -a

list-xinput:
	xinput list

xinput-enable-disable:
	xinput --enable 19
	# xinput --disable 19

display-default-bashrc:
	cat /etc/skel/.bashrc 

free-disk-space:
	df

used-disk-space:
	du -hs ~
	# du -h --max-depth 1
	# du -h --max-depth 2 | grep -e "G" -e "M"

firewall-allow:
	sudo ufw allow 1880

firewall-deny:
	sudo ufw deny 1880

laptop-version:
	sudo dmidecode

laptop-battery-stats:
	upower -i /org/freedesktop/UPower/devices/battery_BAT0

laptop-battery-remaining-percentage:
	cat /sys/class/power_supply/BAT0/capacity
