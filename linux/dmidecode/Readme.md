# dmidecode

### Get Motherboard Model
~~~~
$ sudo dmidecode -s baseboard-product-name
Z10PE-D16 Series
~~~~

### Get Motherboard Details
~~~~
$ sudo dmidecode -t baseboard
# dmidecode 3.1
Getting SMBIOS data from sysfs.
SMBIOS 2.8 present.

Handle 0x0002, DMI type 2, 15 bytes
Base Board Information
	Manufacturer: ASUSTeK COMPUTER INC.
	Product Name: Z10PE-D16 Series
	Version: Rev 1.xx
	Serial Number: 160675319900082
	Asset Tag: To be filled by O.E.M.
	Features:
		Board is a hosting board
		Board is replaceable
	Location In Chassis: To be filled by O.E.M.
	Chassis Handle: 0x0003
	Type: Motherboard
	Contained Object Handles: 0

Handle 0x002A, DMI type 10, 8 bytes
On Board Device 1 Information
	Type: Video
	Status: Enabled
	Description:  AST2400
On Board Device 2 Information
	Type: Ethernet
	Status: Enabled
	Description:  Intel I350

Handle 0x005C, DMI type 41, 11 bytes
Onboard Device
	Reference Designation:  Onboard IGD
	Type: Video
	Status: Enabled
	Type Instance: 1
	Bus Address: 0000:00:02.0

Handle 0x005D, DMI type 41, 11 bytes
Onboard Device
	Reference Designation:  Onboard LAN
	Type: Ethernet
	Status: Enabled
	Type Instance: 1
	Bus Address: 0000:00:19.0
~~~~

### Motherboard Manufacturer
~~~~
$ sudo dmidecode -s baseboard-manufacturer
ASUSTeK COMPUTER INC.
~~~~

### Processor Information
~~~~
$ sudo dmidecode -s processor-family
Xeon
Xeon

$ sudo dmidecode -s processor-manufacturer
Intel
Intel

$ sudo dmidecode -s processor-version
Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz
Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz

$ sudo dmidecode -s processor-frequency
2200 MHz
2200 MHz
~~~~
