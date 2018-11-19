# File:		buildpg.sh
# Author:	Ahbaid Gaffoor
# Date:		Sun Nov 18th 2018
# Version:	0.1

# {{{ functions

# {{{ usage
function usage() {
   echo
   echo "Usage: $0 <version>"
   echo "- version: x.y"
   echo "- Example: $0 10.4"
   echo 'Try "pgtab -a" to see existing versions'
   echo
}
# }}}

# {{{ create_new_dir()
function create_new_dir() {
   DIR=$1
   if [ -d $DIR ]; then
      echo "Found $DIR ... continuing..."
   else
      echo "$DIR not found ... creating..."
      mkdir -p $DIR || { echo "Could not create $DIR ... aborting."; exit 1; }
fi 
}
# }}}

# }}}

# {{{ Validate input
if [ $# -ne 1 ]; then
   usage
   exit 1
fi
# }}}

# {{{ Env Variables

# Assign input parameter to postgres version (10.5 for example)
PGV=$1

# PG Home
PGH=~postgres

# Downloads directory
PGD=$PGH/downloads

# FTP location
FTP="https://ftp.postgresql.org/pub/source/v$PGV/postgresql-$PGV.tar.gz"

# Downloaded tarball
PGS="$PGD/postgresql-$PGV.tar.gz"

# Extracted tarball directory
PGE=$PGD/postgresql-$PGV

# Postgres binary and man path targets
PGT=$PGH/$PGV
PGM=$PGT/man

# Logging
export DATESTR=`date +%Y%m%d-%H%M%S`
export PGLOG=$PGE/pgbuild-$DATESTR.log

# Build options
PGOPTS=" --prefix=$PGT --with-python --with-pam --with-openssl --with-libxml --mandir=$PGM"

# PG_TAB
PG_TAB=$PGH/admin/etc/pgtab

# }}}

# {{{ Validate Download Destination $PGD exists or create it
create_new_dir $PGD
# }}}

# {{{ Download and extract postgres source

# {{{ Download $PGS if not found
if [ ! -f $PGS ]; then
   echo "Did not find $PGS ... downloading from $FTP ..."
   wget -P $PGD $FTP || { echo "wget failure... aborting."; exit 1; }
fi
# }}}

# {{{ Extract if found (will not overwrite existing extract)
if [ -f $PGS ]; then
   if [ -d $PGE ]; then
      echo "Found existing extract directory $PGE... not extracting again."
   else
      echo "Did not find $PGE ... extracting $PGS in $PGD ..."
      cd $PGD || { echo "Failed to enter $PGD ... aborting."; exit 1; }
      tar -zxf $PGS || { echo "Extract of $PGS in $PGD failed ... aborting."; exit 1; }
   fi
else
   echo "Could not find $PGS in $PGD ... aborting."
   exit 1
fi
# }}}

# }}}

# {{{ Validate Build Target directories $PGT and $PGM
create_new_dir $PGT
create_new_dir $PGM
# }}}

# {{{ Build postgres $PGV from source in $PGE to $PGT

if [ -f $PGT/bin/psql ]; then
   echo "Found psql already in $PGT/bin ... skipping build process... consider clean up of $PGT location..."
else

   echo "Starting build of postgres $PGV from source in $PGE to $PGT ... at `date +%Y%m%d-%H%M%S`"
   cd $PGE
   
   # configure
   echo "[configure] starting at `date +%Y%m%d-%H%M%S` ... review $PGLOG for details..."
   ./configure $PGOPTS 1>>$PGLOG 2>&1; 
   
   # make
   echo "[make] starting at `date +%Y%m%d-%H%M%S` ... review $PGLOG for details..."
   make 1>>$PGLOG 2>&1;
   
   # make install
   echo "[make install] starting at `date +%Y%m%d-%H%M%S` ... review $PGLOG for details..."
   make install 1>>$PGLOG 2>&1;
   
   # make install-docs
   echo "[make install-docs] starting at `date +%Y%m%d-%H%M%S` ... review $PGLOG for details..."
   make install-docs 1>>$PGLOG 2>&1;

fi

# }}} 

# {{{ Add entries to pgtab

if [ ! -f $PG_TAB ]; then
   echo "Cannot find $PG_TAB... skipping addition of entries for $PGV ... try \"pgtab -a\" to review entries."
else
   if [ `grep -v ^# $PG_TAB | grep ":" | awk -F ":" '{print $1}' | grep ^"$PGV" | wc -l` == "0" ]; then
      DATESTR=`date +%Y%m%d-%H%M%S`
      echo "Adding $PGV entries into $PG_TAB ..."
      PGSTR="$PGV:$PGH/$PGV:$PGH/$PGV/data:5432:N"
      echo "Adding $PGSTR to $PG_TAB"
      cp $PG_TAB $PG_TAB.backup.$DATESTR
      echo $PGSTR >> $PG_TAB
      echo "Backup at $PG_TAB.backup.$DATESTR ... differences are...."
      diff $PG_TAB $PG_TAB.backup.$DATESTR
   else
      echo "Already found $PGV entry uncommented in $PG_TAB ... no changes made.. try \"pgtab -a\" to review entries."
      grep -v ^# $PG_TAB | grep ^"$PGV"
   fi
fi

# }}}
