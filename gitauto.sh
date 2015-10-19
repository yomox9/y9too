#!/bin/sh -eu

#auto git
set +e
~nmrihserver/y9tool/b pushd ~/dotfiles ; sleep 1 && ~nmrihserver/y9tool/b gitpush.sh; sleep 1
~nmrihserver/y9tool/b pushd ~/y9tool   ; sleep 1 && ~nmrihserver/y9tool/b gitpush.sh; sleep 1
