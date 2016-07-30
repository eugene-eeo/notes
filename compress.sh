#!/usr/bin/env bash

function build_one() {
    printf " $(tput setaf 2)Building$(tput sgr0) $1\n"
    cat "$1" | html-minifier \
        --remove-attribute-quotes \
        --collapse-boolean-attributes \
        --collapse-whitespace \
        --remove-comments \
        --remove-optional-tags \
        --minify-js \
        --minify-css \
        -o "$1.min"
    mv "$1.min" "$1"
}

export -f build_one
ls build/* | xargs -n 1 -P 4 -I {} bash -c 'build_one "{}"'
