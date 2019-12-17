ACTIVE_SESSION="$(tmux display -p '#S')"
tmux kill-session -t $ACTIVE_SESSION
