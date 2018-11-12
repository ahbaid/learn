#!/bin/bash 
# {{{ Header Notes
# Name: create-hadoop-vms.sh
# Date: Apr 1st 2017
# Use: Clone machines for hadoop cluster
#
# Notes:
# ======
# The source machine has all needed pieces of code installed.
# }}}

# The source disk from the base machine
export SRC=/lsi/ld0/vm/base/ubuntu-16.10-base-image.vdi
if [ ! -f $SRC ]; then
   echo
   echo "Cannot find $SRC"
   echo
   exit 1
fi

# Machines are created from n through m inclusive
export n=1
export m=10

# Machine Settings
OSTYPE="Ubuntu_64"
MEMSIZE=16384
CPUS=8
CPUCAP=50
IDECONTROLLER="PIIX4"
SATACONTROLLER="IntelAHCI"
NICTYPE="82540EM"


# Clone disks for machines n through m
seq -w $n $m | while read i; do

   hdf=/lsi/ld0/vm/hadoop/hdp$i/hadoop-hd0.vdi
   mkdir -p /lsi/ld0/vm/hadoop/hdp$i

   if [ ! -f $hdf ]; then
      VBoxManage clonemedium disk $SRC $hdf 
   fi

done

# Create machines for machines n through m
seq -w $n $m | while read i; do

   hdf=/lsi/ld0/vm/hadoop/hdp$i/hadoop-hd0.vdi

   VMNAME=hdp$i

   # Create the VM and register it
   VBoxManage createvm --name $VMNAME --register

   # Set OS Type
   VBoxManage modifyvm $VMNAME --ostype $OSTYPE

   # Set Boot Order
   VBoxManage modifyvm $VMNAME --boot1 disk --boot2 dvd --boot3 none --boot4 none

   # Set Memory
   VBoxManage modifyvm $VMNAME --memory $MEMSIZE

   # Set CPUs and execution cap %, set APIC ON
   VBoxManage modifyvm $VMNAME --cpus $CPUS
   VBoxManage modifyvm $VMNAME --cpuexecutioncap $CPUCAP
   VBoxManage modifyvm $VMNAME --apic on

   # Create two controllers, IDE for CD images, SATA for hard drives
   VBoxManage storagectl $VMNAME --name IDE --add ide --controller $IDECONTROLLER --bootable on
   VBoxManage storagectl $VMNAME --name SATA --add sata --controller $SATACONTROLLER --bootable on

   # Attach the hard disk file to the SATA controller
   VBoxManage storageattach $VMNAME --storagectl SATA --port 0 --device 0 --type hdd --medium "$hdf"

   # Setup Bridged Networking
   VBoxManage modifyvm $VMNAME --nic1 bridged --nictype1 $NICTYPE --cableconnected1 on
   VBoxManage modifyvm $VMNAME --macaddress1 auto

done
