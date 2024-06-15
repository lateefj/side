
# Prompt that is not very specifal

set -g __fish_git_prompt_showupstream auto
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '🌫️ '
set __fish_git_prompt_char_stagedstate '🪨 '
set __fish_git_prompt_char_untrackedfiles '🛤️ '
set __fish_git_prompt_char_stashstate '🥸 '
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

function fish_prompt
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l normal (set_color normal)

  set_color blue
  echo -n '<'
  set_color red
  echo -n (hostname|cut -d . -f 1)
  set_color blue
  echo -n '@'
  set_color green
  echo -n (uname -s)
  set_color blue
  echo -n ':'
  set_color red
  switch $PLATFORM
    case Darwin
      echo -n (uname -m)
    case '*'
      echo -n (uname -i)
  end
  set_color blue
  echo -n '> '
  echo -n '['
  set_color green
  echo -n (date '+%m-%d-%Y %X')
  set_color blue
  echo -n ']'

  set last_status $status

  set_color normal
  if set -q VIRTUAL_ENV
    echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " " (prompt_pwd)
  else
    echo -n -s ' '(prompt_pwd)
  end
  set_color $fish_color_cwd
  fish_git_prompt
  set_color normal
  # Create a newline as the prompt is getting long!
  echo
  #set -l arrow " $red➜ "
  set -l arrow "$red 🙏 $red➜  "
  set_color normal
  echo $arrow
end
