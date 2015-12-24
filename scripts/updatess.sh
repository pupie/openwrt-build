wget -O- 'http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' | awk -F\| '/CN\|ipv4/ { printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > /etc/chinadns_chnroute.txt
ln -s /etc/chinadns_chnroute.txt /etc/ignore.list
/etc/init.d/chinadns restart
/etc/init.d/shadowsocks restart