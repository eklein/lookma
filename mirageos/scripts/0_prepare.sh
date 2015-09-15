#!/bin/bash

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:avsm/ppa
sudo apt-get update && sudo apt-get install -y curl build-essential m4 ocaml opam libgmp-dev libpcre3-dev libxen-dev pkg-config

opam init
opam update
opam install mirage

echo '#####   Run this to activate Mirage! ######'
echo 'eval `opam config env`'
