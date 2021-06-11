# hypervm-taidos
My HyperVM Fork

I will be more arround the HyperVM installation, until its a working panel, any help will be great :)

ROADMAP:

- HyperVM-NG Repo (error in installation due to be down) Solved
- SimFS settings related to old OpenVZ versions Solved
- Ploop Settings to disk usage shorted out.

TODO:
- Solve Burstable settings
- Rebuild VPS improvements ( still dont work, it brokes the VPS when you do it) for now only erase and create a new one!
- More improvements on disk usage in hypervm 
- Downloading templates ( will add some on installation, for now use: https://download.openvz.org/template/precreated/ )
- Network testing (with what i have i just know local network, i know it work "node<->quest" but to outside i dont)


For now it works the vps creation, remember this is for OpenVZ 7 OS with the EZ templates installed and images on the cache, im developing this on one stable and working enviroment, if you have CentOS 7 install and you want to use HyperVM i made the script for it, but the recomendation is 10GB on / partition or more and the rest as LVM in ext4 mounted on /vz
