#!/usr/bin/env bash

for i in build/*; do
    cat $i | html-minifier \
        --remove-attribute-quotes \
        --collapse-boolean-attributes \
        --collapse-whitespace \
        --remove-comments \
        --remove-optional-tags \
        --minify-js \
        --minify-css \
        -o $i.min
    mv "$i.min" $i
done
