# REFERENCES:
# * http://linuxclass.heinz.cmu.edu/doc/tlcl.pdf
# * https://itsfoss.com/
# * https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html

# See also https://cheatography.com/davechild/cheat-sheets/linux-command-line/
# 

.SILENT: help man

##SECTION: Help tools, find tools

list:
	@grep '^[^#[:space:]].*:' ~/github/ubuntu/Makefile | sort | less

help:
	echo "man <command>"
	echo "$$ man ls"
	echo "------"
	echo "info <gnu tool name>"
	echo "$$ info coreutils"
	echo "------"
	echo "List docs folder"
	echo "ls /usr/share/doc"
	echo "------"
	echo "<command> --help"
	echo "$$ ls --help"
	echo "------"
	echo "Quick bash help"
	echo "$$ help"
	echo "------"
	echo "help <command>"
	echo "$$ help pwd"
	echo "------"
	echo "'which', 'type', 'file' discloses information about commands, aliases, file types etc"
	echo "$$ which python"
	echo "$$ type ls"
	echo "$$ file ~/.bashrc"
	echo "------"

section-list:
	grep -h '^##SECTION:' ~/github/ubuntu/Makefile

find-tools-list:
	apropos list
	# man -k list

find-tools-compress:
	apropos compress

find-tools-email:
	apropos email

find-tools-email-address:
	apropos email address

find-tools-partition:
	apropos partition
	
find-tools-that-support-regex:
	zgrep -El 'regex|regular expression' /usr/share/man/man1/*.gz


##SECTION: Hot Key, Key binding

hotkey-tty:
	# i.e intr = ^C; quit = ^\; erase = ^?; kill = ^U; eof = ^D
	# ... stop = ^S; susp = ^Z; 
	stty -a

hotkey-wm:
	gsettings list-recursively org.gnome.desktop.wm.keybindings | less

hotkey-media:
	gsettings list-recursively com.canonical.unity.settings-daemon.plugins.media-keys | less

hotkey-gnome-shell:
	gsettings list-recursively org.gnome.shell.keybindings | less

hotkey-gnome-terminal-legacy:
	gsettings list-recursively org.gnome.Terminal.Legacy.Settings | less

hotkey-nemo:
	gsettings list-recursively org.nemo | less

hotkey-find:
	gsettings list-recursively | grep '<Control><Alt>' | less

##SECTION: Ubuntu, apt, dpkg

ubuntu-support-status:
	hwe-support-status --verbose
	ubuntu-security-status

ubuntu-version-etc-os-release:
	cat /etc/os-release

ubuntu-version-release-info:
	lsb_release -a

ubuntu-version-neofetch:
	# sudo apt install neofetch
	neofetch

ubuntu-version-kernel:
	cat /proc/version

ubuntu-apt-list-installed-locally-packages:
	apt list | grep '\[installed,local\]'
	
ubuntu-apt-list-added-repos:
	sudo grep -rhE ^deb /etc/apt/sources.list*
	sudo apt-cache policy
	# cat /etc/apt/sources.list
	# ls /etc/apt/sources.list.d/

ubuntu-apt-force-update-from-unsigned-repo:
	# https://askubuntu.com/questions/732985/force-update-from-unsigned-repository
	# W: GPG error: http://www.deb-multimedia.org jessie InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 5C808C2B65558117
	# sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5C808C2B65558117

ubuntu-apt-show-available-versions:
	# previously --> apt-cache madison libc6
	apt list -a libc6

ubuntu-apt-download:
	# Useful to recover from circular dependency issue.
	apt download libc6=2.31-0ubuntu9.2
	# dpkg -i libc6_2.31-0ubuntu9.2_amd64.deb

ubuntu-apt-install-specific-version:
	# sudo apt-get install <package-name>=<package-version-number>

# https://itsfoss.com/ppa-guide/
ubuntu-apt-add-repo:
ifndef APT_REPO_URL
	@echo "You must set APT_REPO_URL"
	@echo "Usage: export APT_REPO_URL='ppa:domain/link' && make ubuntu-apt-add-repo"
else
	sudo add-apt-repository $$APT_REPO_URL
	sudo apt-get update
endif

# https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
# GUI Alternative: via "Software & Updates" --> "Other Software" tab
ubuntu-apt-remove-repo:
ifndef APT_REPO_URL
	@echo "You must set APT_REPO_URL"
	@echo "Usage: export APT_REPO_URL='ppa:domain/link' && make ubuntu-apt-remove-repo"
else
	sudo add-apt-repository --remove $$APT_REPO_URL
	sudo apt-get update
endif


debian-dpkg-install:
	# low level package management tool for debian systems
	# `sudo apt install ./download.deb` also works
	# sudo apt-get install -f # Install dependencies
	@echo "Usage: "
	@echo "$$ dpkg -i package.deb"

debian-dpkg-identify:
	@echo "Usage: "
	@echo "$$ dpkg -S package.deb"

debian-dpkg-check-status:
	@echo "Usage: "
	@echo "$$ dpkg -s package_name"
	@echo "Same as:"
	@echo "$$ apt show package_name"

debian-dpkg-list-installed-packages:
	dpkg -l

debian-dpkg-search-logs:
	@echo "Usage: "
	@echo "$$ debian-dpkg-search.logs.sh package_name"


# Ref: https://askubuntu.com/questions/1234452/ubuntu-20-04-user-not-listed-to-login
ubuntu-account-service-system-account:
	sudo cat /var/lib/AccountsService/users/ahmet | grep SystemAccount

ubuntu-desktop-links-hint:
	desktop-file-validate /home/ahmet/.local/share/applications/me.mitya57.ReText.desktop
	sudo update-desktop-database

##SECTION: Display Server/Manager, Gnome Shell & extension

# Sample output:
#   10635 tty2     00:00:00 gdm-x-session
#   10637 tty2     01:59:56 Xorg
#   10650 tty2     00:00:00 gnome-session-b
# https://www.x.org/wiki/
# X11
show-display-server:
	ps -e | grep tty

show-display-manager:
	systemctl status display-manager.service
	# update display manager
	# sudo dpkg-reconfigure gdm3


gnome-shell-version:
	gnome-shell --version
	# GNOME Shell 3.36.9
	# apt-cache show gnome-shell | grep Version

gnome-extension-list:
	gnome-extensions list

gnome-extension-directory:
	cd ~/.local/share/gnome-shell/extensions

gnome-shell-list-keybindings:
	# https://wiki.ubuntu.com/Keybindings
	# https://wiki.gnome.org/Projects/GnomeShell/CheatSheet
	gsettings list-recursively | less

gnome-shell-list-schemas:
	gsettings list-schemas

gnome-shell-update-keybinding:
	# org.gnome.desktop.wm.keybindings toggle-shaded ['<Control><Alt>s']
	# gsettings set org.gnome.desktop.wm.keybindings toggle-shaded "['disabled']"


##SECTION: List things

list-binaries:
	echo $$PATH | tr ":" " " | ls | sort | less 

list-installed-apps:
	snap list
	sudo apt list --installed
	pip3 list
	npm ls -g
	npm ls

list-installed-app-names:
	grep -R "Name=" ~/.local/share/applications
	grep -R "Name=" /usr/share/applications
	ls /snap
	umake --list-installed

list-c-libs:
	ls /usr/include

list-environment-variables:
	env
	# printenv
	# printenv USER
	# cat /etc/environment

list-large-files:
	find ~ -type f -size +10M

list-awkward-filenames:
	find . -regex '.*[^-_./0-9a-zA-Z].*'

list-converter-tools:
	# such as ps2pdf
	ls /usr/bin/*[[:alpha:]]2[[:alpha:]]*

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

list-shell-commands:
	bash -c "compgen -s"

list-xinput:
	xinput list


##SECTION: Hardware commands

hdw-show_my_architecture:
	uname -m

hdw-cpu-info:
	less /proc/cpuinfo

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

uname-options:
	# -a: print all info
	uname -a 
	# -r: print the kernel release
	uname -r 
	# -p: print the processor type (non-portable)
	uname -p 
	# -i: print the hardware platform (non-portable)
	uname -i
	# -m: print the machine hardware name
	uname -m

##SECTION: Hints

# $(())
hint-arithmetic_expansion:
	# +, -, *, /, %, **
	echo $(((5**2) * 3))

# {}
hint-brace_expansion:
	echo Front-{A,B,C}-Back
	echo a{A{1,2},B{3,4}}b
	echo Number_{1..5}
	echo {Z..A}
	echo {001..15}
	# mkdir {2007..2009}-{01..12}

# $()
# `` --> alternate syntax
hint-command-substitution:
	ls -l $(which cp)
	# ls -l `which cp`
	file $(ls -d /usr/bin/* | grep zip)

hint-cd:
	# previous directory
	cd -

hint-cal:
	# calendar
	cal

hint-cat:
	# get input from stdio. Use Ctrl-d (EOF) to finish
	cat
	#
	# concat all movie.mpeg files to a single mpeg file
	# $ cat movie.mpeg.0* > movie.mpeg

hint-check-dictionary:
	grep -i '^a...t$$' /usr/share/dict/american-english

hint-compress:
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

hint-date:
	date

hint-escape-chars:
	echo "The balance for user $USER is: \$5.00"
	# Escape $, !, &, spaces, and others
	# mv bad\&filename good_filename

hint-formatting-output:
	# nl, fold, fmt, pr, printf, groff
	# nl distros.txt | head
	echo {1..50} | fold -w 40 -s
	# fmt -cw 50 fmt-info.txt
	# pr -l 15 -w 65 distros.txt
	# 
	# https://docs.freebsd.org/44doc/usd/20.meref/paper.pdf
	# zcat /usr/share/man/man1/ls.1.gz | groff -mandoc -T ascii | head
	# zcat /usr/share/man/man1/ls.1.gz | groff -mandoc > ~/Desktop/ls.ps 
	# ps2pdf ~/Desktop/foo.ps ~/Desktop/ls.pdf
	# ls /usr/bin/*[[:alpha:]]2[[:alpha:]]*

hint-history:
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

hint-linux-directories:

	# /bin: Contains binaries (programs) that must be present for the
	# system to boot and run.
	# 
	# /boot: Contains the Linux kernel, initial RAM disk image (for
	# drivers needed at boot time), and the boot loader.
	# 
	# /dev: This is a special directory that contains device nodes.
	# “Everything is a file” also applies to devices. Here is where
	# the kernel maintains a list of all the devices it understands.
	# 
	# /etc: /etc directory contains all of the system-wide
	# configuration files. It also contains a collection of shell
	# scripts that start each of the system services at boot time.
	# Everything in this directory should be readable text.
	# 
	# /etc/fstab: a table of storage devices and their associated mount points
	# `blkid`
	# 
	# /etc/passwd: a list of the user accounts.
	# 
	# /usr/bin: /usr/bin contains the executable programs installed by
	# the Linux distribution. It is not uncommon for this directory
	# to hold thousands of programs.
	# 
	# /usr/share: /usr/share contains all the shared data used by
	# programs in /usr/bin. This includes things such as
	# default configuration files, icons, screen backgrounds, sound
	# files, etc.
	# 
	# /usr/share/doc: Most packages installed on the system will include some
	# kind of documentation. In /usr/share/doc, we will find
	# documentation files organized by package.

hint-permission:
	# id, chmod, umask, su, sudo, chown, chgrp, passwd
	# See also https://linuxhandbook.com/linux-file-permissions/
	# https://linuxhandbook.com/suid-sgid-sticky-bit/
	id
	# cat /etc/passwd
	# cat /etc/group
	# cat /etc/shadow
	# passwd [user]

hint-proc:
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

hint-process:
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

hint-process-signals:
	# 2: INT: Interrupt (Ctrl-c)
	# 9: KILL: Like TERM but program does not get any signal. Kernel just terminates
	# 15: TERM: Terminate
	# 18: CONT: Continue (This signal is sent by bg and fg commands)
	# 19: STOP: Like TSTP but program does not get any signal. 
	# 20: TSTP: Terminal Stop (Ctrl-z)
	kill -l


hint-process-tree:
	pstree

hint-quotes:
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

hint-redirection:
	# cat, sort, uniq, grep, wc, head, tail, tee

hint-regex:
	find . -name Makefile -exec grep -l docker '{}' \;
	find . -name Makefile -exec grep -H docker '{}' \;	
	find . -name Makefile -exec rg -H docker '{}' \;	

hint-reset:
	# reset current shell
	reset
	# clear
	# Ctrl+L

hint-search:
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

hint-set:
	# shell set options
	# display all functions
	set | less

hint-shutdown:
	@echo "$$ sudo shutdown -h now"
	@echo "$$ sudo shutdown -h"
	@echo "$$ sudo shutdown -h +10m &"
	@echo "$$ sudo shutdown -h 23:59"
	@echo "$$ Cancel previous shutdown command"
	@echo "$$ sudo shutdown -c"

hint-storage:
	# mount, umount, fsck, fdisk, mkfs, dd, genisoimage, wodim, md5sum
	# 
	# A file named /etc/fstab (short for “file system table”) lists the devices (typically
	#   hard disk partitions) that are to be mounted at boot time.
	# cat /etc/fstab

hint-sudo:
	# Execute previous command with sudo
	@echo "$$ sudo !!"
	# echo fs.inotify.max_user_watches=582222 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

hint-superuser:
	# su -
	# su -c 'command'
	# cat /etc/sudoers
	# sudo command
	sudo -l


hint-systemctl:
	# systemctl list-unit-files | grep nordvpn
	# https://ulauncher.io/
	# https://github.com/Ulauncher/Ulauncher/
	# systemctl --user enable --now ulauncher
	# -p: reload config 
	# echo fs.inotify.max_user_watches=582222 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

hint-text-processing:
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
	# http://www.gnu.org/software/sed/manual/sed.html
	# aspell check filename

hint-tload:
	# system load average
	tload
 
hint-vmstat:
	# virtual memory stats every 5 seconds
	vmstat 5


hint-user:
	# adduser addgroup

hint-vlc:
	# https://medium.com/@petehouston/use-vlc-to-play-camera-with-different-formats-17cf839b72d0
	vlc v4l2://
	# vlc v4l2://
	# vlc v4l2:///dev/video0
	# vlc v4l2:///dev/video0:chroma=h264
	# vlc v4l2:///dev/video0:chroma=mjpg
	# vlc v4l2:///dev/video0:chroma=mjpg --v4l2-width 800 --v4l2-height 600
	# vlc v4l2:///dev/video0:chroma=mjpg:width=1280:height=720


##SECTION: Disk, Firewall, Settings, Others

disk-space-free:
	df -h

disk-space-used:
	du -hs ~
	# du -h --max-depth 1
	# du -h --max-depth 2 | grep -e "G" -e "M"

display-default-bashrc:
	cat /etc/skel/.bashrc 

firewall-allow:
	sudo ufw allow 1880

firewall-deny:
	sudo ufw deny 1880

power-settings:
	gsettings list-recursively org.gnome.settings-daemon.plugins.power | less

record-shell-session:
	# record entire shell session
	# use `exit` to finish recording
	script myrecordingname.script

unity-settings:
	gsettings list-recursively | grep com.canonical.unity

update-alternatives-list-selections:
	sudo update-alternatives --get-selections

update-alternatives-add-new-option:
	# Probably the following file can be updated manually as well:
	# cat /var/lib/dpkg/alternatives/x-www-browser
	#
	# The following seems to be the official way:
	# sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /snap/bin/brave 90

update-alternatives-window-manager:
	sudo update-alternatives --config x-window-manager

update-wm:
	# sudo dpkg-reconfigure lightdm
	# sudo dpkg-reconfigure gdm3
	# sudo dpkg-reconfigure sddm

xscreensaver-deactivate:
	xscreensaver-command -deactivate

xscreensaver-activate:
	xscreensaver-command -activate

kvm-find-ip-address-of-linux-kvm-guest-virtual-machine:
	virsh net-list
	virsh net-info default
	virsh net-dhcp-leases default

bye:
	echo "bye"


