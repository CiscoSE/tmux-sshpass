#!/bin/env bash

# requires:
#   * tmux
#   * sshpass


tmux new -s test

for y in 23 33; do

  for x in $(seq 1 7; seq 50 51; seq 211 216); do

    tmux send-keys -t test:0.0 C-m C-m C-m "# -->192.${y}.22.${x}<--" C-m C-m
    tmux send-keys -t test:0.0 "/usr/bin/sshpass -p password /usr/bin/ssh cisco@10.${y}.20.${x}" C-m
    sleep 5
    tmux send-keys -t test:0.0 "copy run start" C-m C-m
    sleep 5
    tmux send-keys -t test:0.0 "exit" C-m C-m
    sleep 5

  done

done
