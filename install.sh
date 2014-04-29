#!/bin/sh
(
    cd lib/record-holder
    rm -rf target
    lein do clean, deps, install
)
