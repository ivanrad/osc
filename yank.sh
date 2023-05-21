#!/usr/bin/env bash
set -e

buf=$(cat "${@:--}" | base64 | tr -d '\n')
# OSC 52 term seq
seq="\033]52;c;${buf}\a"
if [ -n "${TMUX}" ]; then
  client_tty=$(tmux display-message -p '#{client_tty}')
  if [ -n "${client_tty}" ]; then
    printf "$seq" > "${client_tty}"
  fi
else
  printf "$seq"
fi
