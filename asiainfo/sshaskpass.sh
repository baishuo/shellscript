#!/bin/bash
if [ -n "$SSH_ASKPASS_FD" ]
then
        read password <&$SSH_ASKPASS_FD
        echo "$password"
        exit 0
elif [ $# -lt 1 ]
then
        echo "Usage: echo password | $0 <ssh command line>" >&2
        exit 1
fi

export SSH_ASKPASS=$0
export SSH_ASKPASS_FD=4
[ "$DISPLAY" ] || export DISPLAY=dummy:0
read password

exec 3<&0
# write password 100 times to make repeated ssh connections work
for x in $(seq 100)
do
  echo "$password"
done | exec setsid "$@" 4<&0 0<&3
