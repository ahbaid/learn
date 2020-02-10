time dd if=/dev/random of=10G.data bs=1024 count=`echo 1024*1024*10 | bc`
ls -alh 10G.data
