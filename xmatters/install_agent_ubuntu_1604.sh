sudo -- sh -c "echo 'deb http://software.xmatters.com/apt/ stable main' > /etc/apt/sources.list.d/xmatters.list
wget -O - http://software.xmatters.com/apt/xmatters_repo.gpg.key| apt-key add -
apt-get update
export XMATTERS_HOSTNAME=mydomain.hosted.xmatters.com
export XMATTERS_KEY=++++++++++++++++++++++++++++++++++++++++++++++++
export API_KEY=++++++++++++++++++++++++++++++++++++
apt-get install -y xmatters-xa
service xmatters-xa start"
