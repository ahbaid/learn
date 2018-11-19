cd ~postgres/downloads/postgres-11beta2
mkdir -p /opt/postgres/11beta2/man
./configure --prefix=/opt/postgres/11beta2 --with-python --with-pam --with-openssl --with-libxml --mandir=/opt/postgres/11beta2/man
make
make install
make install-docs
