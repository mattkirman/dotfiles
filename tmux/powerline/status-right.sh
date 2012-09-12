#!/usr/bin/env zsh
cwd=$(dirname $0)

# Source global configurations
source "${cwd}/config.sh"

# Source lib functions
source "${cwd}/lib.sh"

# Gmail unread email count
#typeset -A gmail
#gmail=()
#gmail[script]="${segments_path}/gmail.sh"
#gmail[foreground]='white'
#gmail[background]='red'
#gmail[separator]="${separator_left_bold}"
#register_segment 'gmail'

# Date
typeset -A date
date=()
date[script]="${segments_path}/date.sh"
date[foreground]='colour0'
date[background]='colour33'
date[separator]="${separator_left_bold}"
register_segment 'date'

# Print the status line in the order of registration above
print_status_line_right

exit 0
