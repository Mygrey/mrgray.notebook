#!/bin/bash 

expect << EOF
spawn ssh  root@10.1.80.6 mysql -h 10.1.80.6 -u root -pbigDataTeam -Dtraffic < /home/traffic/sqoop_data_clean.sql
expect {
"(yes/no)?" {send "yes\r";exp_continue}
"*assword:" {send "bigDataTeam\r";exp_continue}
}
EOF



