# hypervm-taidos
My HyperVM Fork

HyperVM for new OpenVZ 7/Virtuozzo 7 Install, still need many improvements! But for now this is one alpha but stable, all modifications will be uploaded to the dev branch now and will be on the main branch after several test's and check's.

DONE:

- HyperVM-NG Repo (error in installation due to be down) Solved
- SimFS settings related to old OpenVZ versions Solved
- Ploop Settings to disk usage shorted out.
- Make is workable ( creating vps, deleting vps, set the vps diskspace)
- Patched the usage of the Disk Inodes&Usage to display on HyperVM
- Rebuild improved (/etc/ssh/* on quests makes wrong permissions, for it we need to: chmod go-r /etc/ssh/* )

TODO:
- Solve Burstable settings
- Downloading templates ( will add some on installation, for now use: https://download.openvz.org/template/precreated/
- Network (with what i have i just know local network, i know it work "node<->quest" but to outside i dont, and i believe is not cout the traffic is made.
- Create VNC option and others for VPS

Every update i made on this repository will refrect the new installations (not older ones) to be more fast on repair/update all the installation will use git to get all the needed files and then move, instead of getting the zip files, this way i believe is better. and i hope all the help you may give to put once again working as we expect!

For now it works the vps creation, remember this is for OpenVZ 7 OS with the EZ templates installed and images on the cache, im developing this on one stable and working enviroment, if you have CentOS 7 install and you want to use HyperVM i made the script for it, but the recomendation is 10GB on / partition or more and the rest as LVM in ext4 mounted on /vz

Remember this is for testing ( I will not be responsible for use or damage. ) 

For production right now i recomend one projects: https://www.proxmox.com/en/ 

Those are with ISO image, not just the Panel ONLY ( thats oneonther reason i am doing this ) its near impossible to find one free panel solution this days.

To contact me email me at xester@gmx.com or find me on discord: https://discord.gg/Y2ERCMHa8J
