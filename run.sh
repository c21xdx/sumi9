#!/bin/sh

sed -i "s/8080/$PORT/" ./Caddyfile
chmod +x ./caddy
./caddy start
node ./dist-node/server/index.js
