debug=1

# Record the active pane so it can be set to active again at end of script
active_pane="$(tmux display -p '#{pane_id}')"

# Get the number of panes in the window
total_panes="$(tmux display-message -p '#{window_panes}')"

if $debug; then tmux send-keys -t 0 "echo 'Number of panes: '$total_panes" C-m; fi


## Create a list of panes at the beginning of rows
row_start_panes=()
top_row_start_pane=0
## Figure out which panes are at the start of a row
## Also which row is the top row
for ((i=0;i<$total_panes;i++))
do
	tmux select-pane -t $i
	if [ "$(tmux display -p '#{pane_left}')" == 0 ]
	then
		row_start_panes+=($i)
	fi
	
	if [ "$(tmux display -p '#{pane_left}')" == 0 ] && [ "$(tmux display -p '#{pane_top}')" == 0 ]
	then
		top_row_start_pane=$i
	fi

done
if $debug
then
	for i in "${row_start_panes[@]}"
       	do
		tmux send-keys -t 0 "echo 'Row Start: '$i" C-m
       	done
fi
if $debug; then tmux send-keys -t 0 "echo 'Origin Pane: '$top_row_start_pane" C-m; fi

lines=0
for i in "${row_start_panes[@]}"
do
	#### Resize each pane in the current row

	## Select first pane in row i.e. leftmost pane in row
	tmux select-pane -t $i 

	## Iterate over panes on row, moving to the right until back at the start
	## summing the total useable width

	## First pane, add cols, then iterate until back at first pane
	useable_cols="$(tmux display -p -t $i '#{pane_width}')"
	tmux select-pane -R
	num_panes=1

	while [ "$(tmux display -p '#{pane_left}')" != 0 ]
	do
		CURRENT_COLS="$(tmux display -p '#{pane_width}')"
		useable_cols=$(($useable_cols+$CURRENT_COLS))
		tmux select-pane -R
		num_panes=$(($num_panes+1))
	done

	if $debug; then tmux send-keys -t $i "echo 'Panes in this Row: '$num_panes" C-m; fi
	if $debug; then tmux send-keys -t $i "echo 'Col Width:'$useable_cols" C-m; fi
	
	## Iterate again, resizing panes
	pane_width=$(($useable_cols/$num_panes))
	tmux resize-pane -x $pane_width 
	tmux select-pane -R
	until [ "$(tmux display -p '#{pane_left}')" == 0 ]
	do
		tmux resize-pane -x $pane_width
		tmux select-pane -R
	done

	#### Also sum the lines in each row
	current_lines="$(tmux display -p '#{pane_height}')"
	lines=$(($lines+$current_lines))
done

#### Now Resize rows

## Total useable lines may not be divisible by number of rows
## Therefore add extra lines to top row
pane_height=$(($lines/${#row_start_panes[@]}))
main_pane_height=$((pane_height+($lines%${#row_start_panes[@]})))

remove=($top_row_start_pane)
other_panes=( ${row_start_panes[@]/$remove} )

if $debug
then
	for i in "${other_panes[@]}"
	do
		tmux send-keys -t 0 "echo 'Non Top Row Start Pane: '$i" C-m
	done
fi



tmux resize-pane -t $top_row_start_pane -y $main_pane_height

for i in "${other_panes[@]}"
do
	tmux resize-pane -t $i -y $pane_height
done

# Reset to the original active pane
tmux select-pane -t $active_pane
