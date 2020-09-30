#! /bin/bash

nix-channel --add https://nixos.org/channels/nixpkgs-unstable

mkdir -p $HOME/.config/nixpkgs
cp -r home/* $HOME/.config/nixpkgs
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
nix-shell '<home-manager>' -A install
home-manager switch
