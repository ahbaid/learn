seq -w 1 10 | while read s; do
  echo $s
  ssh -n cb$s sudo shutdown -h now
  ssh -n hdp$s sudo shutdown -h now
done
