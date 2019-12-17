tmux set-window-option synchronize-panes 
SYNC="$(tmux display -p '#{pane_synchronized}')"
if [ "$SYNC" -eq "0" ]
then
	tmux set -g pane-border-fg colour8
else
	tmux set -g pane-border-fg colour9
fi
