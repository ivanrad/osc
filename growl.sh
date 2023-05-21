#!/usr/bin/env bash

if [ $# == 0 ]; then
  msg=$(cat -)
else
  msg="$@"
fi

seq=$'\e]9;%s\a'
if [ -n "$TMUX" ]; then
  client_tty=$(tmux display-message -p '#{client_tty}')
  if [ -n "$client_tty" ]; then
    printf "$seq" "$msg" > "$client_tty"
  fi
else
  printf "$seq" "$msg"
fi
