#!/bin/sh

if [[ -e build ]]; then
    sh build --run
else
    if [[ -e Cargo.toml ]]; then
        cargo run
    fi
fi
