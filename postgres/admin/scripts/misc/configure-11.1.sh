cd ~postgres/downloads/postgres-11.1
mkdir -p /opt/postgres/11.1/man
./configure --prefix=/opt/postgres/11.1 --with-python --with-pam --with-openssl --with-libxml --mandir=/opt/postgres/11.1/man
make
make install
make install-docs
