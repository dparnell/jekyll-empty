#!/bin/bash

sudo rm -rf _site/*

sudo docker run --rm \
  --volume=$PWD:/src \
  -it jekyll \
  build --watch --incremental
