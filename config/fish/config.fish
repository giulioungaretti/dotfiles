set -x fish_cursor_default block
set -x fish_cursor_visual block
set -x fish_cursor_insert line
set -x fish_cursor_replace_one underscore
function fish_mode_prompt; end
set fish_vi_key_bindings command
function fish_mode_prompt; end
set fish_greeting
set -g fish_emoji_width 2
# pyenv-root
set -x PYENV_ROOT $HOME/.pyenv
status --is-interactive; and source (pyenv init -|psub)
