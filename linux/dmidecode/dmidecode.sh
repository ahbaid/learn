#!/bin/bash 
# Author:	Ahbaid Gaffoor
# Date:		Sunday 24th March 2019
# Name:		dmidecode.sh

UL="================================================"

echo -e "# {{{ System"

echo -e "\n# {{{ Slots\n$UL"
dmidecode -t System Slots
echo -e "\n# }}}"

echo -e "\n# {{{ OEM Strings\n$UL"
dmidecode -t 11
echo -e "\n# }}}"

echo -e "\n# {{{ Onboard Devices\n$UL"
dmidecode -t 10,41
echo -e "\n# }}}"

echo -e "\n# {{{ Hardware Security\n$UL"
dmidecode -t 24
echo -e "\n# }}}"

echo -e "\n# {{{ Power Supply\n$UL"
dmidecode -t 39
echo -e "\n# }}}"

echo -e "\n# }}}"

echo -e "# {{{ Motherboard"

echo -e "\n# {{{ Manufacturer\n$UL"
dmidecode -s baseboard-manufacturer
echo -e "\n# }}}"

echo -e "\n# {{{ Product Name\n$UL"
dmidecode -s baseboard-product-name
echo -e "\n# }}}"

echo -e "\n# {{{ Serial Number\n$UL"
dmidecode -s baseboard-serial-number
echo -e "\n# }}}"

echo -e "\n# {{{ Motherboard\n$UL"
dmidecode -t baseboard
echo -e "\n# }}}"

echo -e "\n# }}}"

echo -e "# {{{ BIOS"

echo -e "\n# {{{ Vendor\n$UL"
dmidecode -s bios-vendor
echo -e "\n# }}}"

echo -e "\n# {{{ Version\n$UL"
dmidecode -s bios-version
echo -e "\n# }}}"

echo -e "\n# }}}"

echo -e "# {{{ Processor"

echo -e "\n# {{{ Processor Family\n$UL"
dmidecode -s processor-family
echo -e "\n# }}}"

echo -e "\n# {{{ Processor Manufacturer\n$UL"
dmidecode -s processor-manufacturer
echo -e "\n# }}}"

echo -e "\n# {{{ Processor Version\n$UL"
dmidecode -s processor-version
echo -e "\n# }}}"

echo -e "\n# {{{ Processor Frequency\n$UL"
dmidecode -s processor-frequency
echo -e "\n# }}}"

echo -e "\n# }}}"

echo -e "# {{{ Cache "

dmidecode -t Cache

echo -e "\n# }}}"

echo -e "# {{{ Memory "

echo -e "\n# {{{ Controller\n$UL"
dmidecode -t Memory Controller
echo -e "\n# }}}"

echo -e "\n# {{{ Module\n$UL"
dmidecode -t Memory Module
echo -e "\n# }}}"

echo -e "\n# }}}"

