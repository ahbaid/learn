cd ~postgres/downloads/postgresql-9.6.9 
mkdir -p /opt/postgres/9.6.9/man
./configure --prefix=/opt/postgres/9.6.9 --with-python --with-pam --with-openssl --with-libxml --mandir=/opt/postgres/9.6.9/man
make
make install
make install-docs
