#!/bin/sh
(
    rm -rf $HOME/.m2/repository/record-holder/record-holder
    cd lib/record-holder
    rm -rf target
    lein do clean, deps, install
)
