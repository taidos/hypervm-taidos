# hypervm-taidos
My HyperVM Fork

### Buy me a coffee
[![](https://img.buymeacoffee.com/api/?url=aHR0cHM6Ly9pbWcuYnV5bWVhY29mZmVlLmNvbS9hcGkvP25hbWU9YWRuYW50dXJraSZzaXplPTMwMCZiZy1pbWFnZT1ibWMmYmFja2dyb3VuZD1mZjgxM2Y=&creator=taidos&is_creating=building%20cool%20things%20every%20single%20f**king%20day.&design_code=1&design_color=%23ff813f&slug=taidos)](https://www.buymeacoffee.com/taidos)


HyperVM for new OpenVZ 7/Virtuozzo 7 Install, still need many improvements! But for now this is one alpha but stable, all modifications will be uploaded to the dev branch now and will be on the main branch after several test's and check's.

DONE:

- HyperVM-NG Repo (error in installation due to be down) Solved
- SimFS settings related to old OpenVZ versions Solved
- Ploop Settings to disk usage shorted out.
- Make is workable ( creating vps, deleting vps, set the vps diskspace)
- Patched the usage of the Disk Inodes&Usage to display on HyperVM
- Rebuild improved
- Solve Burstable RAM settings (dropped out on OpenVZ 7).
- Disk inodes changes (dropped out on OpenVZ 7, if you need more inodes you need to upgrade the diskspace, you cant change inodes without it).
- Downloading templates (added on /script/install-extra-ostemplates) - even almalinux 8 i made, tested and working

TODO:
- Backup function when vps is down ( just when is online is making it )
- Network Count (patch can be found on dev branch, network works like old ways and tc rules)
- Create VNC option and others for VPS

Every update i made on this repository will refrect the new installations (not older ones) to be more fast on repair/update all the installation will use git to get all the needed files and then move, instead of getting the zip files, this way i believe is better. and i hope all the help you may give to put once again working as we expect!

For now just the main features works, remember this is for OpenVZ 7 OS with the EZ templates installed and images on the cache, im developing this on one stable and working enviroment, if you have CentOS 7 install and you want to use HyperVM i made the script for it, but the recomendation is 10GB on / partition or more and the rest as LVM in ext4 mounted on /vz

Remember this is for testing ( I will not be responsible for use or damage. ) 

For production right now i recomend one projects: https://www.proxmox.com/en/ 

Those are with ISO image, not just the Panel ONLY ( thats oneonther reason i am doing this ) its near impossible to find one free panel solution this days.

To contact me email me at taidos@sapo.pt or find me on discord: https://discord.gg/Y2ERCMHa8J
