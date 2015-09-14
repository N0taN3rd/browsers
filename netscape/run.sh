#!/bin/bash

export XKEYSYMDB=XKeysymDB
export LD_LIBRARY_PATH=/opt/netscape/lib

cd /home/browser/.netscape

mv /download/preferences.js ./preferences.js
sudo chown browser:browser ./preferences.js
chmod 644 ./preferences.js

PYWB_IP=$(grep memoframe_pywb_1 /etc/hosts | cut -f 1 | head -n 1)

sed -i s/memoframe_pywb_1/$PYWB_IP/g ./preferences.js

awk -v URL="$URL" '{gsub("HOME_PAGE_URL", URL, $0); print}' ./preferences.js > /tmp/prefs.tmp && mv /tmp/prefs.tmp ./preferences.js

cd /opt/netscape

/opt/netscape/lib/ld-linux.so.2 /opt/netscape/netscape -no-about-splash

