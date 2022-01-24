# REFERENCES:
# * http://linuxclass.heinz.cmu.edu/doc/tlcl.pdf
# * https://itsfoss.com/
# * https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html

# See also https://cheatography.com/davechild/cheat-sheets/linux-command-line/
# 

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

ubuntu-cpu-info:
	less /proc/cpuinfo

ubuntu-check-dictionary:
	grep -i '^a...t$$' /usr/share/dict/american-english

ubuntu-find-keybinding:
	gsettings list-recursively | grep '<Control><Alt>' | less
	# gsettings list-recursively org.gnome.desktop.wm.keybindings | sort
	# org.gnome.desktop.wm.keybindings toggle-shaded ['<Control><Alt>s']
	# gsettings set org.gnome.desktop.wm.keybindings toggle-shaded "['disabled']"

ubuntu-list-keybindings:
	# https://wiki.ubuntu.com/Keybindings
	gsettings list-recursively org.gnome.desktop.wm.keybindings | less
	gsettings list-recursively com.canonical.unity.settings-daemon.plugins.media-keys | less
	gsettings list-recursively org.gnome.shell.keybindings | less
	gsettings list-recursively org.gnome.settings-daemon.plugins.power | less
	gsettings list-recursively org.gnome.Terminal.Legacy.Settings | less

linux-proc:
	# https://www.geeksforgeeks.org/proc-file-system-linux/
	# /proc/PID/cmdline	Command line arguments.
	# /proc/PID/cpu	Current and last cpu in which it was executed.
	# /proc/PID/cwd	Link to the current working directory.
	# /proc/PID/environ	Values of environment variables.
	# /proc/PID/exe	Link to the executable of this process.
	# /proc/PID/fd	Directory, which contains all file descriptors.
	# /proc/PID/maps	Memory maps to executables and library files.
	# /proc/PID/mem	Memory held by this process.
	# /proc/PID/root	Link to the root directory of this process.
	# /proc/PID/stat	Process status.
	# /proc/PID/statm	Process memory status information.
	# /proc/PID/status	Process status in human readable form.
	# /proc/crypto	list of available cryptographic modules
	# /proc/diskstats	information (including device numbers) for each of the logical disk devices
	# /proc/filesystems	list of the file systems supported by the kernel at the time of listing
	# /proc/kmsg	holding messages output by the kernel
	# /proc/meminfo	summary of how the kernel is managing its memory.
	# /proc/scsi	information about any devices connected via a SCSI or RAID controller
	# /proc/tty	information about the current terminals
	# /proc/version	containing the Linux kernel version, distribution number, gcc version number (used to build the kernel) 
	#                and any other pertinent information relating to the version of the kernel currently running


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
	
find-apps-that-support-regex:
	zgrep -El 'regex|regular expression' /usr/share/man/man1/*.gz

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

list-installed-packages:
	dpkg -l

package-deb-install:
	# low level package management tool for debian systems
	dpkg -i package_file

package-identify:
	dpkg -S file_name

package-check-status:
	# installed vs not installed vs ...
	dpkg -s zoom

list-environment-variables:
	env
	# printenv
	# printenv USER
	# cat /etc/environment

list-large-files:
	find ~ -type f -size +10M

list-awkward-filenames:
	find . -regex '.*[^-_./0-9a-zA-Z].*'

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

hint_compress:
	# http://www.gnu.org/software/tar/manual/index.html
	# gzip, bzip2, tar, zip, rsync
	# gzip filename
	# gzip -r foldername
	#
	# gzip -d filename.gz
	# gunzip filename.gz
	#
	# gunzip -c filename | less
	# zcat filename.gz | less
	# zless filename
	#
	# tar modes:
	#  c: create
	#  x: extract
	#  r: append
	#  t: list
	# mkdir -p playground/dir-{001..100}
	# touch playground/dir-{001..100}/file-{A..Z}
	# tar cf playground.tar playground
	# tar tf playground.tar
	# option `v`: verbose
	# tar tvf playground.tar
	# mkdir foo
	# cd foo
	# tar xf ../playground.tar
	#
	# sudo tar cf /media/BigDisk/home.tar /home
	# cd /
	# sudo tar xf /media/BigDisk/home.tar
	# tar xf archive.tar pathname
	# tar xf ../playground2.tar --wildcards 'home/me/playground/dir-*/file-A'
	# find playground -name 'file-A' -exec tar rf playground.tar '{}' '+'
	#
	# tar option `z`: use gzip, `j`: use bzip2
	# find playground -name 'file-A' | tar czf playground.tgz -T -
	# ssh remote-sys 'tar cf - Documents' | tar xf -
	#
	# zip / unzip: the main use of these programs is for exchanging files with Windows systems
	#
	# rsync -av source destination
	# # `source/` will copy contents of source directory
	# rsync -av source/ destination
	# 
	# # use `--delete` option so deleted files will be deleted during sync
	# sudo rsync -av --delete /etc /home /usr/local /media/BigDisk/backup
	# sudo rsync -av --delete --rsh=ssh /etc /home /usr/local remote-sys:/backup

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
	# !?string --> Repeat last history list item containing string.
	#
	# Ctrl-r: Incremental search
	#      Ctrl-j: Copy history entry to current command line
	#      Enter: Execute command

hint_networking:
	# http://tldp.org/LDP/nag2/index.html
	# ping, traceroute, ip, netstat, ftp, sftp, wget, ssh, scp
	ping -c 1 linuxcommand.org
	# tracepath slashdot.org
	ip a
	# ip addresses
	ip a | grep inet
	# examine network interface
	netstat -ie
	# kernel's network routing table
	netstat -r
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

hint_process:
	# ps top jobs bg fg kill killall shutdown
	# 
	# Run xlogo as background process
	# xlogo &
	# jobs
	# fg %1
	#
	# Ctrl-c: terminate
	# Ctrl-z: stop/pause (use bg or fg to resume)
	# bg %1
	#

hint_process_tree:
	pstree

hint_regex:
	find . -name Makefile -exec grep -l docker '{}' \;
	find . -name Makefile -exec grep -H docker '{}' \;	
	find . -name Makefile -exec rg -H docker '{}' \;	

hint_search:
	# http://www.gnu.org/software/findutils/
	# locate relies on `sudo updatedb` execution
	locate zip | grep bin
	# locate --regex 'bin/(bz|gz|zip)'
	# find ~
	# find ~ | wc -l
	# find ~ -type d | wc -l
	# M: Megabytes, k: Kilobytes, G: Gigabytes, c: bytes, b: 512-byte blocks (default), w: 2-byte words
	# find ~ -type f -name "*.JPG" -size +1M | wc -l
	#
	# find tests (read man page for all tests):
	# -cmin n Match files or directories whose content or attributes were
		# last modified exactly n minutes ago. To specify less than n
		# minutes ago, use -n, and to specify more than n minutes
		# ago, use +n.
	# -cnewer file Match files or directories whose contents or attributes were
		# last modified more recently than those of file.
	# -ctime n Match files or directories whose contents or attributes were
		# last modified n*24 hours ago.
	# -empty Match empty files and directories.
	# -group name Match file or directories belonging to group. group may
		# be expressed either as a group name or as a numeric group
		# ID.
	# -iname pattern Like the -name test but case-insensitive.
	# -inum n Match files with inode number n. This is helpful for finding
		# all the hard links to a particular inode.
	# 
	# all the files with permissions that are not 0600 and the directories with permis-
	#   sions that are not 0700
	# find ~ \( -type f -not -perm 0600 \) -or \( -type d -not -perm 0700 \) 
	# find ~ -type f -name 'foo*' -ok ls -l '{}' ';'
	# stat filename

hint_storage:
	# mount, umount, fsck, fdisk, mkfs, dd, genisoimage, wodim, md5sum
	# 
	# A file named /etc/fstab (short for “file system table”) lists the devices (typically
	#   hard disk partitions) that are to be mounted at boot time.
	# cat /etc/fstab

hint_vmstat:
	vmstat 5

hint_tload:
	tload
 
hint_process_signals:
	# 2: INT: Interrupt (Ctrl-c)
	# 9: KILL: Like TERM but program does not get any signal. Kernel just terminates
	# 15: TERM: Terminate
	# 18: CONT: Continue (This signal is sent by bg and fg commands)
	# 19: STOP: Like TSTP but program does not get any signal. 
	# 20: TSTP: Terminal Stop (Ctrl-z)
	kill -l

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
	# display all functions
	set | less

hint_shutdown_10_minutes:
	# sudo shutdown -h now
	# sudo shutdown -h
	sudo shutdown -h +10m &
	# sudo shutdown -h 23:59
	# sudo shutdown -c

hint_superuser:
	# su -
	# su -c 'command'
	# cat /etc/sudoers
	# sudo command
	sudo -l

hint_text_processing:
	# cat, sort, uniq, cut, paste, join, comm, diff, patch, tr, sed, aspell
	# # print non-printing chars
	# cat -A foo.txt
	# # (s)uppress multiple blank lines and (n)umarate printed lines
	# cat -ns foo.txt
	# sort file1.txt file2.txt file3.txt > final_sorted_list.txt
	# # sort by numeric value order in reverse
	# du -s /usr/share/* | sort -nr | head
	# # sort -k 5 ---> sorts by 5th column
	# # sort by `:` delimited fields
	# sort -t ':' -k 7 /etc/passwd | head
	# # uniq removes duplicate lines if they are adjacent to each other so use `sort` first
	# # cut -c 7-10 --> cut by char array
	# # cut -f 3    --> cut by field number
	# # cut -d delim --> cut by delimiter
	# echo "lowercase letters" | tr a-z A-Z
	# echo "front" | sed 's/front/back/'
	# echo "front" | sed 's_front_back_'
	# sed -n '1,5p' distros.txt
hint_user:
	# adduser addgroup

end_of_file:
	echo "bye"


