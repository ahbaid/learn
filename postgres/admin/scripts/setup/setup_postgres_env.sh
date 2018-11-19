# File:		setup_postgres_env.sh
# Author:	Ahbaid Gaffoor
# Date:		Sat 14th July 2018
# Version:	0.1

# {{{ validate postgres home is /opt/postgres
export PG_HOME_DEFAULT=/opt/postgres

if [ ~postgres != "$PG_HOME_DEFAULT" ]; then
   echo -e "\npostgres user home not found in expected $PG_HOME_DEFAULT\n"
   exit 1
fi
# }}}

# {{{ Backup existing ~/.bashrc and ~/.bash_profile 

export DATESTR=`date +%Y%m%d-%H%M%S`

# Backup current ~/.bashrc if it exists
if [ -f ~/.bashrc ]; then
  cp ~/.bashrc ~/.bashrc-$DATESTR
fi

# Backup current ~/.bash_profile if it exists
if [ -f ~/.bash_profile ]; then
  cp ~/.bash_profile ~/.bash_profile-$DATESTR
fi

# }}}

# {{{ Symlink ~postgres/admin/env/postgres.bash* to ~

export PG_BASH_ENV=~/admin/env
export PG_BP=$PG_BASH_ENV/postgres.bash_profile
export PG_BRC=$PG_BASH_ENV/postgres.bashrc

if [ -f $PG_BP ]; then
   ln -sb $PG_BP ~/.bash_profile
   ls -al ~/.bash_profile
fi

if [ -f $PG_BRC ]; then
   ln -sb $PG_BRC ~/.bashrc
   ls -al ~/.bashrc
fi

# }}}
