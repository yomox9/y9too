#!/bin/sh -eu

#auto git
set +e
pushd ~/dotfiles ; sleep 1 && ~nmrihserver/y9tool/b gitpush.sh; sleep 1
pushd ~/y9tool   ; sleep 1 && ~nmrihserver/y9tool/b gitpush.sh; sleep 1
