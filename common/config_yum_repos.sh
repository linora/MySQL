REPOFILE='http://mirrors.163.com/.help/CentOS6-Base-163.repo'

yum install -y wget
cd /etc/yum.repos.d
ls | while read REPO; do mv $REPO ${REPO}.bak; done
wget ${REPOFILE}
