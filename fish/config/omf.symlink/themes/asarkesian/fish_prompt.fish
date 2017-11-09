source $OMF_PATH/themes/agnoster/fish_prompt.fish

function parse_git_dirty
  set -l submodule_syntax
  set submodule_syntax "--ignore-submodules=dirty"
  if [ -e (git rev-parse --show-toplevel)/.omf_parse_git_dirty ]
    set git_dirty (command git status --porcelain $submodule_syntax  2> /dev/null)
  end
  if [ -n "$git_dirty" ]
    if [ $__fish_git_prompt_showdirtystate = "yes" ]
      echo -n "$__fish_git_prompt_char_dirtystate"
    end
  else
    if [ $__fish_git_prompt_showdirtystate = "yes" ]
      echo -n "$__fish_git_prompt_char_cleanstate"
    end
  end
end
