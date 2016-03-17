
set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"

function git_prompt -d "Display the actual git state"
  set -l ref
  set -l dirty
  if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
    set dirty (parse_git_dirty)
    set ref (command git symbolic-ref HEAD 2> /dev/null)
    set ref (command git symbolic-ref HEAD 2> /dev/null)
    if [ $status -gt 0 ]
      set -l branch (command git show-ref --head -s --abbrev |head -n1 2> /dev/null)
      set ref "➦ $branch "
    end
    #set branch_symbol \uE0A0
    set -l branch (echo $ref | sed  "s-refs/heads/-$branch_symbol -")
    if [ "$dirty" != "" ]
      #prompt_segment red black "($branch| $dirty)"
      set_color green
      echo -n " ($branch|"
      set_color red
      echo -n " $dirty"
      set_color green 
      echo -n ")"
    else
      #prompt_segment green black "($branch| $dirty)"
      set_color green
      echo -n " ($branch|"
      set_color red
      echo -n " $dirty"
      set_color green 
      echo -n ")"
    end
    set_color normal
  end
end

function hg_prompt
    if hg root >/dev/null 2>&1
        set_color blue
        printf ' (%s)' (hg branch ^/dev/null)
        set_color normal
    end
end

function fish_prompt
    set -l red (set_color -o red)
    set -l blue (set_color -o blue)
    set -l normal (set_color normal)

    set_color blue
    echo -n '['
    echo -n (date '+%m-%d-%Y %X')
    echo -n ']'

    #prompt_hg
    #prompt_git
    #git_prompt
    hg_prompt

    set -l arrow " $red➜ "
    #set -l arrow "$red: "
    set_color normal
    if set -q VIRTUAL_ENV
        echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " " (prompt_pwd) $arrow
    else
      echo -n -s ' '(prompt_pwd) $arrow
    end
end
