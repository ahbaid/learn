alias mdesc="cat /etc/hosts | grep -v ^# | grep -i ^198 | grep -i $1"

# {{{ mssh 
function mssh() {
  if [ `cat /etc/hosts | grep -v ^# | grep ^198 | awk '{print $3}' | grep $1 | wc -l` -eq 1 ]; then
     hn=`cat /etc/hosts | grep -v ^# | grep ^198 | grep " $1" | awk '{print $1}'`
     echo "ssh to $hn"
     time ssh $hn
  else
     echo
     echo "unable to ssh, no suitable single match found...."
     echo
     cat /etc/hosts | grep -v ^# | grep ^198 | grep $1 
     echo 
  fi
}
# }}}
