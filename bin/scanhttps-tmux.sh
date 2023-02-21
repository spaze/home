#!/bin/sh
tmux new-session  'scanhttps.sh web1' \; split-window 'scanhttps.sh web2' \; split-window 'scanhttps.sh web3' \; split-window 'scanhttps.sh ib1' \; split-window 'scanhttps.sh ib2' \; split-window 'scanhttps.sh ib3' \; select-layout even-vertical \;
