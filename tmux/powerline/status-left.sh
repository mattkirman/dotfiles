#!/usr/bin/env zsh
cwd=$(dirname $0)

# Source global configurations
source "${cwd}/config.sh"

# Source lib functions
source "${cwd}/lib.sh"

# Hostname
typeset -A hostname
hostname=()
hostname[script]="${segments_path}/hostname.sh"
hostname[foreground]='colour234'
hostname[background]='colour148'
hostname[separator]="${separator_right_bold}"
register_segment 'hostname'

# Print the status line in the order of registration above
print_status_line_left

exit 0
