#!/bin/sh

set -ex

cd /app

npm install -g pnpm
cd /app && cd ui && pnpm install && CI=false pnpm build && cd ..
cd /app && mkdir -p public
cp -rfv ui/build/* public/

exit

docker run --rm -v $PWD:/app node:18-alpine /app/buildweb.sh
