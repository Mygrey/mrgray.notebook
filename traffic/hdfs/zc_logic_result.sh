#!/bin/bash 

expect << EOF
spawn ssh  root@10.1.80.6 python /home/traffic/logic_train.py
expect {
"(yes/no)?" {send "yes\r";exp_continue}
"*assword:" {send "bigDataTeam\r";exp_continue}
}
EOF

sleep 3m
echo "wait for python!"
