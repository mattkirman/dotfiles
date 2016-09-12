entries=()

if [ "$USE_PATCHED_FONTS" = "true" ]; then
  # Separators (patched font required)
  separator_left_bold="\ue0b2"
	separator_left_thin="\ue0b3"
	separator_right_bold="\ue0b0"
	separator_right_thin="\ue0b1"
else
  # Alternative separators in the normal unicode table
  separator_left_bold="◀"
	separator_left_thin="❮"
	separator_right_bold="▶"
	separator_right_thin="❯"
fi

# Register a segment
register_segment() {
  segment_name=$1
  entries[$(($#entries+1))]="$segment_name"
}

#
first_segment_left=1
print_status_line_left() {
  prev_bg='black'
  for entry in $entries; do
    local script=$(eval "echo \${${entry}[script]}")
    local foreground=$(eval "echo \${${entry}[foreground]}")
    local background=$(eval "echo \${${entry}[background]}")
    local separator=$(eval "echo \${${entry}[separator]}")
		local separator_fg=""
		if [ $(eval "echo \${${entry}[separator_fg]+_}") ]; then
			separator_fg=$(eval "echo \${${entry}[separator_fg]}")
		fi

    local output="$(${script})"
    if [ -z "$output" ]; then
      continue
    fi

    __ui_left "$prev_bg" "$background" "$foreground" "$separator" "$separator_fg"
    echo -n $output
    prev_bg="$background"

    if [ "$first_segment_left" -eq "1" ]; then
			first_segment_left=0
		fi
  done
  __ui_left "black" "black" "red" "$separator_right_bold" "$prev_bg"

  # End in a clean state
  echo "#[default]"
}

#
print_status_line_right() {
  local prev_bg="black"
	for entry in $entries; do
		local script=$(eval "echo \${${entry}[script]}")
		local foreground=$(eval "echo \${${entry}[foreground]}")
		local background=$(eval "echo \${${entry}[background]}")
		local separator=$(eval "echo \${${entry}[separator]}")
		local separator_fg=""
		if [ $(eval "echo \${${entry}[separator_fg]+_}") ]; then
			separator_fg=$(eval "echo \${${entry}[separator_fg]}")
		fi

		local output="$(${script})"
		if [ -z "$output" ]; then
			continue
		fi

		__ui_right "$prev_bg" "$background" "$foreground" "$separator" "$separator_fg"
		echo -n "$output"
		prev_bg="$background"
	done
	# End in a clean state.
	echo "#[default]"
}

#
__ui_left() {
  local bg_left="$1"
	local bg_right="$2"
	local fg_right="$3"
	local separator
	if [ "$first_segment_left" -eq "1" ]; then
		separator=""
	else
		separator="$4"
	fi

	local separator_bg
	if [ -n "$5" ]; then
		bg_left="$5"
		separator_bg="$bg_right"
	else
		separator_bg="$bg_right"
	fi

	if [ "$first_segment_left" -eq "1" ]; then
		echo -n "#[bg=${bg_right}]"
	fi

	echo -n " #[fg=${bg_left}, bg=${separator_bg}]${separator}#[fg=${fg_right},bg=${bg_right}]"

	if [ "$first_segment_left" -ne "1" ]; then
		echo -n " "
	fi
}

#
__ui_right() {
  local bg_left="$1"
  local bg_right="$2"
  local fg_right="$3"
  local separator="$4"
  local separator_fg
  if [ -n "$5" ]; then
    separator_fg="$5"
  else
    separator_fg="$bg_right"
  fi
  echo -n " #[fg=${separator_fg}, bg=${bg_left}]${separator}#[fg=${fg_right},bg=${bg_right}] "
}
