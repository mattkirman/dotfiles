if [ ! -z "$TMUX" ]; then

  # Tmux windows should be named after the project I'm currently working on
  function _update_tmux_window_name() {
    local code_dir="${HOME}/Code/"

    if [ "${PWD##$code_dir}" != "${PWD}" ]; then
      tmux rename-window "${PWD##$code_dir}"
    fi
  }
  chpwd_functions+=(_update_tmux_window_name)

fi
