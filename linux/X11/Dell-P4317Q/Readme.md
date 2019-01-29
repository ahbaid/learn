# /etc/X11/xorg.conf for Dell P4317Q

### Video Card
* This host has two cards:
** A Radeon HD 4670 Card
** Motherboard Built-In Card
~~~~
# lspci -knn | grep VGA
02:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] RV730 XT [Radeon HD 4670] [1002:9490]
08:00.0 VGA compatible controller [0300]: ASPEED Technology, Inc. ASPEED Graphics Family [1a03:2000] (rev 30)
~~~~

### X11 log files
#### Location:
~~~~
# pwd
/var/log

# ls -alrt Xorg*
-rw-r--r-- 1 root root  8527 Jan 27 15:53 Xorg.1.log
-rw-r--r-- 1 root root 83520 Jan 29 00:44 Xorg.0.log.old
-rw-r--r-- 1 root root 93939 Jan 29 00:58 Xorg.0.log
~~~~
#### Supported Image Sizes:
~~~~
# cat Xorg.0.log | grep "Image Size"
[    31.374] (II) RADEON(0): Max Image Size [cm]: horiz.: 94  vert.: 53
[    31.374] (II) RADEON(0): clock: 262.8 MHz   Image Size:  941 x 529 mm
[    31.374] (II) RADEON(0): clock: 148.5 MHz   Image Size:  941 x 529 mm
[    31.374] (II) RADEON(0): clock: 209.8 MHz   Image Size:  941 x 529 mm
[    31.374] (II) RADEON(0): clock: 262.8 MHz   Image Size:  941 x 529 mm
[    31.374] (II) RADEON(0): clock: 147.2 MHz   Image Size:  941 x 529 mm
~~~~

### xorg.conf
* Ubuntu 18.04: /etc/X11/xorg.conf
