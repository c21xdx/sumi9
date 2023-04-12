#!/bin/sh

sed -i "s/8080/$PORT/" ./Caddyfile
chmod +x ./caddy
./caddy run
node  ./dist-node/server/index.js
