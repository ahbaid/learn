# File:		postgres.bashrc
# Author:	Ahbaid Gaffoor
# Date:		Sat 14th July 2018
# Version:	0.1
#
# {{{ Notes
#
# 07/14/2018
# ==========
# Initial code
#
# }}}

# {{{ Env variables

# {{{ Save default prompt and set custom prompt
export OPS1="\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ "
export PS1=$OPS1
# }}}

# {{{ Preserve default shell & manpage paths
export OPATH=$PATH
export OMANPATH=$MANPATH
# }}}

# {{{ PG_* environment variables
export PG_ADMIN=~postgres/admin
export PG_CFG=$PG_ADMIN/config
export PG_SCRIPTS=$PG_ADMIN/scripts
export PG_ETC=$PG_ADMIN/etc
export PG_TAB=$PG_ETC/pgtab
export PG_ENV=$PG_ADMIN/env
export PG_ALIASES=$PG_ENV/postgres.aliases
# }}}

# }}}

# {{{ Source PG Aliases
source $PG_ALIASES || echo -e "\nCould not find $PG_ALIASES\n"
# }}}

# {{{ Define pg* Functions

# {{{ function pgtab

pgtab () {
   if [ "$#" -gt 0 ]; then
     case $1 in
        "-a")
           echo 
           echo "All entries in $PG_TAB"
           echo "============================================"
           cat $PG_TAB
           echo 
           ;;
        "-e")
			  DATESTR=`date +%Y%m%d-%H%M%S`
           cp $PG_TAB $PG_TAB.backup.$DATESTR
           vim $PG_TAB
           echo
           echo "Edit of $PG_TAB complete, backup at $PG_TAB.backup.$DATESTR"
           echo "Differences: "
           diff $PG_TAB $PG_TAB.backup.$DATESTR
           echo
           ;;
        *) 
           echo
           echo "Usage:"
           echo "pgtab (-a|-e)"
           echo "-a : optional for all entries / raw file"
           echo "-e : edit $PG_TAB file"
           echo
           ;;
      esac
   else
      echo
      echo "Usable entries in $PG_TAB"
      echo "============================================"
      cat $PG_TAB | grep -v ^#
      echo
   fi
}

# }}}

# {{{ function pgset

pgset () {
   if [ "$#" -gt 0 ]; then
      if [ `cat $PG_TAB | grep -v ^# | grep ^$1 | wc -l` -eq 1 ]; then
         export PG_HOME=`cat $PG_TAB | grep -v ^# | grep ^$1 | awk -F: '{print $2}'`
         alias pghome="cd $PG_HOME"
         export PG_BIN=$PG_HOME/bin
         alias pgbin="cd $PG_BIN"
         export PG_MAN=$PG_HOME/man
         export PG_VERSION=$1
         export PATH=$OPATH:$PG_BIN
         export MANPATH=$OMANPATH:$PG_MAN
         export PS1="\e[01;20m\]${PG_VERSION:+($PG_VERSION)}\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ "
      else
         echo -e "\nCould Not Find $1 entry (uncommented in $PG_TAB).\n"
         echo -e "Try \"pgtab -a\" to validate entries in $PG_TAB\n"
      fi
   else
      echo -e "\nUsage: pgset <postgres_version>\n"
   fi
}

# }}}

# {{{ function pgunset

pgunset () {
   unset PG_HOME
   unalias pghome
   unset PG_BIN
   unalias pgbin
   unset PG_MAN
   unset PG_VERSION
   export PATH=$OPATH
   export MANPATH=$OMANPATH
   export PS1=$OPS1
}

# }}}

# {{{ function pginfo

pginfo () {
   if [ ! -z $PG_HOME ]; then
      echo -e "\nPostgres Info:"
      echo -e "==========================="
      echo -e "Version:  $PG_VERSION"
      echo -e "Postgres Home: $PG_HOME"
      echo -e "\n"
      echo -e "Path: $PATH"
      echo -e "Manpath: $MANPATH"
      echo -e "\n"
   else
      echo -e "\nNo env setup, please run \"pgtab -a\" then \"pgset <postgres_version>\"\n"
   fi
}

# }}}

# }}}

