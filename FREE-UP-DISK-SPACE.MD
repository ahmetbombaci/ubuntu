# Reference

https://itsfoss.com/free-up-space-ubuntu-linux/

# Clean up APT cache in Ubuntu

`sudo du -sh /var/cache/apt`

* option 1 (delete old packages): `sudo apt-get autoclean`
* option 2 (delete everything):    `sudo apt-get clean`


# Clear systemd journal logs

`journalctl --disk-usage`

Delete everything older than 3 days: `sudo journalctl --vacuum-time=3d`


# Remove older versions of Snap applications

`du -h /var/lib/snapd/snaps`


`sudo ./remove-old-snap-versions.sh`


# Clean the thumbnail cache

`du -sh ~/.cache/thumbnails`

`rm -rf ~/.cache/thumbnails/*`


