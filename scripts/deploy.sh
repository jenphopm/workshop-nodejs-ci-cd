#!/bin/sh

ssh root@139.59.98.231 <<EOF
  cd ~/workshop-nodejs-ci-cd
  git pull
  npm install --production
  pm2 restart all
  exit
EOF