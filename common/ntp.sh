CLIENT_SERVER='192.168.204.0'
CLIENT_NET_MASK='255.255.255.0'

yum install -y ntp ntpdate
chkconfig --level=345 ntpd on

cp /etc/ntp.conf /etc/ntp.conf.$(date '+%s')
mkdir -p /var/log/ntp

cat > /etc/ntp.conf <<EOF
server 127.127.1.0  //指定服务器从本地同步
restrict ${CLIENT_SERVER} mask ${CLIENT_NET_MASK} nomodify notrap //开放对应网段权限
fudge 127.127.1.0 stratum 0
driftfile /etc/ntp/drift
statsdir /var/log/ntp/
logfile /var/log/ntp/ntp.log  //指定日志文件
EOF

service ntpd restart
service ntpd status
