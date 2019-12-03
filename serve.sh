#!/bin/bash

sudo rm -rf _site/*

sudo docker run -p 5000:5000 --rm \
  --volume=$PWD:/src \
  -it jekyll \
  serve --host 0.0.0.0 --port 5000
