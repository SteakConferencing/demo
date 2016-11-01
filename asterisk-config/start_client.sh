#!/bin/sh

# be sure the sil.wav was created with:
# sox -n -r 8000 -c 1 -b 16 sil.wav trim 0.0 5.0

sourcefile="/var/lib/asterisk/sounds/$1.wav"
silfile="/var/lib/asterisk/sounds/sil.wav"
res1="/tmp/$1pl1.wav"
res2="/tmp/$1pl2.wav"
res3="/tmp/$1pl3.wav"
callnumber="sip:$1@localhost"

sox $sourcefile $silfile $silfile $res1
sox $silfile $sourcefile $silfile $res2
sox $silfile $silfile $sourcefile $res3 
/var/lib/asterisk/demo_client $callnumber sip:6002@localhost 6002 6002 asterisk sip:localhost $res1 $(( ( RANDOM % 65534 )  + 1024 )) &
/var/lib/asterisk/demo_client $callnumber sip:6002@localhost 6002 6002 asterisk sip:localhost $res2 $(( ( RANDOM % 65534 )  + 1024 )) &
/var/lib/asterisk/demo_client $callnumber sip:6002@localhost 6002 6002 asterisk sip:localhost $res3 $(( ( RANDOM % 65534 )  + 1024 )) &
