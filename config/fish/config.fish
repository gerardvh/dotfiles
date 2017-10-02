# # Set global variable for dotfiles root
if test ! $DOTS
  set -U DOTS $HOME/.dotfiles
  # echo "Set universal variable: DOTS > $DOTS"
end

# # THEME PURE #
set fish_function_path /Users/gerardvh/.config/fish/functions/pure $fish_function_path

# # My functions
set fish_function_path $HOME/.config/fish/my_functions $fish_function_path

# # My completions
set fish_completions_path $HOME/.config/fish/my_completions $fish_completions_path

# # Setup git prompt settings (check docs in the fish-shell source for more)
set __fish_git_prompt_show_informative_status true
set __fish_git_prompt_showcolorhints true

# # Setup paths from path.zsh or path.fish files
# for path_file in (find -H $DOTS -maxdepth 2 -name "path.*sh")
#   echo "Adding this path file: $path_file"
#   # add_paths_file $path_file
# end


add_path $DOTS/bin

