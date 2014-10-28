# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "base"

# Split window into panes.
split_v 20
run_cmd "watch -t date"
split_h 60
run_cmd "htop"
# Set active pane.
select_pane 0
