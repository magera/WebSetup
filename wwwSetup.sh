#!/bin/sh
MakeMenu () {
echo "Select item"
echo -e "\t" System info
echo -e "\t" Install Envirovement
echo -e "\t" Update System
}


SysInfo () {
/root/scripts/SysInfo.sh;
}

# SysUpdate - produces a system update
SysUpdate () {
yum update ;
}

WwwEnvInstall () {
yum -y install epel-release ;
yum -y install vim mc wget bash-completion ;
}

while true
 do
   MakeMenu

   read answer

   MSG=

  case $answer in
        0|O)  SysInfo;;
        1|A)  WwwEnvInstall;;
        2|B)  epick;;
        3|C)  apick;;
        4|D)  gpick;;
        5|E)  hpick;;
        6|F)  ipick;;
        7|G)  bpick;;
        8|H)  cpick;;
        9|I)  jpick;;
        10|J)  kpick;;
        11|K)  rpick;;
        12|L)  tpick;;
        13|M)  ypick;;
        14|N)  wpick;;
        15|O)  npick;;
        16|P)  mpick;;
        17|Q)  spick;;
        18|Q)  zpick;;
        19|U)  SysUpdate;;
        *) badchoice;;

   esac
done
