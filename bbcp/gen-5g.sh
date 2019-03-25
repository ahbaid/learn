time dd if=/dev/random of=5G.data bs=1024 count=`echo 1024*1024*5 | bc`
ls -alh 5G.data
