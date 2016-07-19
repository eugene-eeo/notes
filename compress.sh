#!/usr/bin/env bash

for i in build/*; do
    cat $i | html-minifier \
        --remove-attribute-quotes \
        --remove-comments \
        --remove-optional-tags \
        --collapse-boolean-attributes \
        --minify-js \
        --minify-css \
        -o $i.min
    mv "$i.min" $i
done
