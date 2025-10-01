#!/bin/bash
set -o nounset

pushd ~/.config/i3 > /dev/null

# Run all commands in a subshell and pipe the final output to rofi
(
    # Get all bindsym $mod lines, exclude comments, move/workspace commands
    grep '^bindsym $mod' config | \
    grep -v '^#' | \
    grep -v 'move container to' | \
    grep -v 'workspace $ws' | \
    # Remove 'bindsym ' prefix
    sed 's/bindsym //' | \
    # Exclude lines that might be for key assignment/variables (contain '=')
    grep -v '=' | \
    # Process each key and line
    while read key line
    do
        # Format the output
        printf "%20s\t?\t%s\n" "$key" "$line"
    done
) | rofi -dmenu

popd > /dev/null
