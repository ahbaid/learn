#!/bin/bash 

UL="================================================"

echo -e "# {{{ Motherboard"

echo -e "\n# Manufacturer\n$UL"
dmidecode -s baseboard-manufacturer

echo -e "\n# Product Name\n$UL"
dmidecode -s baseboard-product-name

echo -e "\n# Motherboard\n$UL"
dmidecode -t baseboard

echo -e "# }}}"

echo -e "# {{{ Processor"

echo -e "\n# Processor Family\n$UL"
dmidecode -s processor-family

echo -e "\n# Processor Manufacturer\n$UL"
dmidecode -s processor-manufacturer

echo -e "\n# Processor Version\n$UL"
dmidecode -s processor-version

echo -e "\n# Processort Frequency\n$UL"
dmidecode -s processor-frequency

echo -e "# }}}"
