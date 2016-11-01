#!/bin/sh

sourcefile="/var/lib/asterisk/sounds/waroftheworlds.wav"
callnumber="sip:$1@localhost"

/var/lib/asterisk/demo_client $callnumber sip:6002@localhost 6002 6002 asterisk sip:localhost $sourcefile $(( ( RANDOM % 65534 )  + 1024 )) &
