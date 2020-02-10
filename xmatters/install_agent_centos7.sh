sudo -- sh -c "cat > '/etc/yum.repos.d/xmatters.repo' << EOL
[xmatters]
name=xMatters, inc. Yum Repo
baseurl=http://software.xmatters.com/yum
enabled=1
gpgcheck=1
gpgkey=http://software.xmatters.com/yum/RPM-GPG-KEY-xmatters
EOL
export XMATTERS_HOSTNAME=mydomain.hosted.xmatters.com
export XMATTERS_KEY=++++++++++++++++++++++++++++++++++++++++++++++++
export API_KEY=++++++++++++++++++++++++++++++++++++
yum -y install xmatters-xa
service xmatters-xa start"
