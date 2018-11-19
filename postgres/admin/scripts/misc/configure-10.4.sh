cd ~postgres/downloads/postgresql-10.4
mkdir -p /opt/postgres/10.4/man
./configure --prefix=/opt/postgres/10.4 --with-python --with-pam --with-openssl --with-libxml --mandir=/opt/postgres/10.4/man
make
make install
make install-docs
