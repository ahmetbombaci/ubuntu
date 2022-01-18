# REFERENCES:
# * http://linuxclass.heinz.cmu.edu/doc/tlcl.pdf
# * https://itsfoss.com/
# * https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html

ubuntu-support-status:
	hwe-support-status --verbose
	ubuntu-security-status

ubuntu-version-release-etc:
	cat /etc/os-release

ubuntu-version-release-info:
	lsb_release -a

ubuntu-version-neofetch:
	# sudo apt install neofetch
	neofetch

ubuntu-version-kernel:
	cat /proc/version

ubuntu-version-kernel-uname:
	uname -a 
	uname -r 
	uname -p 
	uname -i

find-tools:
	apropos list
	# man -k list
	apropos compress
	apropos email
	apropos email address
	apropos partition
	
help:
	# GNO Core Utils
	info coreutils
	# man ls
	# file <filename>
	# type ls
	# which ls
	# ls --help
	# help
	# help pwd
	ls /usr/share/doc

list-binaries:
	ls /bin /usr/bin | sort | less
	# TODO
	# echo $PATH, split via `:`, list directories
	# /home/ahmet/.local/share/umake/bin:/home/ahmet/bin:/home/ahmet/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-8-openjdk-amd64:/snap/bin


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
	ls /snap
	umake --list-installed

list-environment-variables:
	env
	# printenv
	# cat /etc/environment

list-list-commands:
	apropos list

list-pci:
	lspci

# list the most popular Debian packages
list-popular-debian-packages:
	popularity-contest | head -n 50

list-routes:
	routel

list-shells:
	cat /etc/shells

list-xinput:
	xinput list

display-default-bashrc:
	cat /etc/skel/.bashrc 

disk-space-free:
	df

disk-space-used:
	du -hs ~
	# du -h --max-depth 1
	# du -h --max-depth 2 | grep -e "G" -e "M"

firewall-allow:
	sudo ufw allow 1880

firewall-deny:
	sudo ufw deny 1880

# Hardware commands

hdw-laptop-version:
	sudo dmidecode

hdw-list-hardware:
	sudo lshw

hdw-laptop-battery-stats:
	upower -i /org/freedesktop/UPower/devices/battery_BAT0

hdw-laptop-battery-remaining-percentage:
	cat /sys/class/power_supply/BAT0/capacity

hdw-xinput-enable-disable:
	xinput --enable 19
	# xinput --disable 19

# hints
# $(())
hint_arithmetic_expansion:
	# +, -, *, /, %, **
	echo $(((5**2) * 3))

# {}
hint_brace_expansion:
	echo Front-{A,B,C}-Back
	echo a{A{1,2},B{3,4}}b
	echo Number_{1..5}
	echo {Z..A}
	echo {001..15}
	# mkdir {2007..2009}-{01..12}

# $()
# `` --> alternate syntax
hint_command_substitution:
	ls -l $(which cp)
	# ls -l `which cp`
	file $(ls -d /usr/bin/* | grep zip)

hint_cd:
	# previous directory
	cd -

hint_cal:
	# calendar
	cal
hint_cat:
	# get input from stdio. Use Ctrl-d (EOF) to finish
	cat
	#
	# concat all movie.mpeg files to a single mpeg file
	# $ cat movie.mpeg.0* > movie.mpeg

hint_date:
	date

hint_escape_chars:
	echo "The balance for user $USER is: \$5.00"
	# Escape $, !, &, spaces, and others
	# mv bad\&filename good_filename

hint_history:
	history | less
	# Execute 88th command in history
	# !88
	# 
	# Repeat the last command
	# !!
	#
	# !string --> Repeat last history list item starting with string.
i	# !?string --> Repeat last history list item containing string.
	#
	# Ctrl-r: Incremental search
	#      Ctrl-j: Copy history entry to current command line
	#      Enter: Execute command

hint_process:
	# ps top jobs bg fg kill killall shutdown

hint_permission:
	# id, chmod, umask, su, sudo, chown, chgrp, passwd
	id
	# cat /etc/passwd
	# cat /etc/group
	# cat /etc/shadow
	# passwd [user]

hint_quotes:
	# double "...."
	# If we place text inside double
	# quotes, all the special characters used by the shell lose their special meaning and are
	# treated as ordinary characters. The exceptions are $, \ (backslash), and ` (back-quote).
	# This means that word-splitting, pathname expansion, tilde expansion, and brace expan-
	# sion are suppressed, but parameter expansion, arithmetic expansion, and command sub-
	# stitution are still carried out. Using double quotes, we can cope with filenames containing
	# embedded spaces.
	ls -l "two words.txt"
	# single 'suppress all expansions'
	# [me@linuxbox ~]$ echo text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER
	# text /home/me/ls-output.txt a b foo 4 me
	# [me@linuxbox ~]$ echo "text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER"
	# text ~/*.txt {a,b} foo 4 me
	# [me@linuxbox ~]$ echo 'text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER'
	# text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER

hint_redirection:
	# cat, sort, uniq, grep, wc, head, tail, tee

hint_reset:
	# reset current shell
	reset
	# clear

hint_script:
	# record entire shell session
	# use `exit` to finish recording
	script myrecordingname.script

hint_set:
	# shell set options
	set | less

hint_superuser:
	# su -
	# su -c 'command'
	# cat /etc/sudoers
	# sudo command
	sudo -l
hint_user:
	# adduser addgroup


