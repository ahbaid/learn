#!/bin/bash 
echo "# {{{ Motherboard"
dmidecode -s baseboard-product-name
dmidecode -t baseboard
dmidecode -s baseboard-manufacturer
echo "# }}}"
echo "# {{{ Motherboard"
dmidecode -s processor-family
dmidecode -s processor-manufacturer
dmidecode -s processor-version
dmidecode -s processor-frequency
echo "# }}}"
