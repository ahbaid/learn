#!/bin/bash -x
# {{{ Header Notes
# Name: create-couchbase-vms.sh
# Date: Apr 1st 2017
# Use: Clone machines for couchbase cluster
#
# Notes:
# ======
# The source machine has all needed pieces of code installed.
# }}}

# The source disk from the base machine
#export SRC=/lsi/ld0/vm/couchbase/cb01/couchbase-hd0.vdi
export SRC=/lsi/ld0/vm/couchbase/ubuntu-14.04-base-image.vdi

# Machines are created from n through m inclusive
export n=2
export m=10

# Machine Settings
OSTYPE="Ubuntu_64"
MEMSIZE=16384
CPUS=16
CPUCAP=50
IDECONTROLLER="PIIX4"
SATACONTROLLER="IntelAHCI"
NICTYPE="82540EM"


# Clone disks for machines n through m
seq -w $n $m | while read i; do

   hdf=/lsi/ld0/vm/couchbase/cb$i/couchbase-hd0.vdi

   if [ ! -f $hdf ]; then
      VBoxManage clonemedium disk $SRC $hdf 
   fi

done

# Create machines for machines n through m
seq -w $n $m | while read i; do

   hdf=/lsi/ld0/vm/couchbase/cb$i/couchbase-hd0.vdi

   VMNAME=cb$i

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
