time dd if=/dev/random of=1G.data bs=1024 count=`echo 1024*1024 | bc`
ls -alh 1G.data
