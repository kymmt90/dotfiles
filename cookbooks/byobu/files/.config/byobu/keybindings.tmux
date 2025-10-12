# Change prefix to C-q
unbind-key -n C-a
unbind-key -n C-q
set -g prefix ^Q
set -g prefix2 F12
bind-key q send-prefix

# Split pane vertically with -
unbind-key -
bind-key - split-window -v -c "#{pane_current_path}"

# Split pane horizontally with |
unbind-key |
bind-key | split-window -h -c "#{pane_current_path}"
