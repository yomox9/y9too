#!/bin/sh -eu

#auto git
set +e
pushd ~/dotfiles && gitpush.sh
pushd ~/y9tool   && gitpush.sh
