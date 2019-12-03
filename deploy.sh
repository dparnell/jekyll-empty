#!/bin/sh

OUTPUT_DIR=/tmp/.production_build

TARGET_USER=root
TARGET_HOST=site.com
TARGET_PATH=/var/www/html


sudo rm -rf $OUTPUT_DIR
mkdir -p $OUTPUT_DIR

sudo docker run --rm \
  --volume=$PWD:/src \
  --volume=$OUTPUT_DIR:/output \
  -e JEKYLL_ENV='production' \
  -it jekyll \
  build --config _config.yml,_config_prod.yml --destination /output

rsync -rtlzv --delete --progress -e "ssh -l $TARGET_USER" $OUTPUT_DIR/ $TARGET_HOST:$TARGET_PATH

