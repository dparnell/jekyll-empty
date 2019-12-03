#!/bin/bash

sudo docker run --rm \
     --volume=$PWD:/src \
     --entrypoint=/bin/bash \
     -it jekyll \
     -c "htmlproofer --allow-hash-href --assume-extension /src/_site 2> /src/_site/htmlproofer.txt"

HOST=`hostname`

echo
echo Visit http://$HOST/htmlproofer.txt for the report
