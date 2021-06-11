# hypervm-taidos
My HyperVM Fork

I will be more arround the HyperVM installation, until its a working panel, any help will be great :)

ROADMAP:

- HyperVM-NG Repo (error in installation due to be down) Solved
- SimFS settings related to old OpenVZ versions Solved
- Ploop Settings to disk usage shorted out.
- Make is workable ( creating vps, deleting vps, set the vps diskspace)

TODO:
- Solve Burstable settings
- Rebuild VPS improvements ( still dont work, it brokes the VPS when you do it) for now only erase and create a new one!
- More improvements on disk usage in hypervm 
- Downloading templates ( will add some on installation, for now use: https://download.openvz.org/template/precreated/ )
- Network testing (with what i have i just know local network, i know it work "node<->quest" but to outside i dont)

Every update i made on this repository will refrect the new installations (not older ones) to be more fast on repair/update all the installation will use git to get all the needed files and then move, instead of getting the zip files, this way i believe is better. and i hope all the help you may give to put once again working as we expect!

For now it works the vps creation, remember this is for OpenVZ 7 OS with the EZ templates installed and images on the cache, im developing this on one stable and working enviroment, if you have CentOS 7 install and you want to use HyperVM i made the script for it, but the recomendation is 10GB on / partition or more and the rest as LVM in ext4 mounted on /vz

Remenber this is for testing ( I will not be responsible for use or damage. ) 

For production right now i recomend two projects:
-https://www.aventurin.net
-https://www.proxmox.com

Those are with ISO image, not just the Panel ONLY ( thats oneonther reason i am doing this ) its near impossible to find one free panel solution this days
