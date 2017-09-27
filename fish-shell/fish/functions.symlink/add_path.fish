function add_path --description 'Add an individual path to fish_user_paths, if not there already.'
	for path in $argv
    if not contains $path $fish_user_paths
      set -U fish_user_paths $fish_user_paths $path
      if isatty
        echo Updating fish_user_paths with: $path
        echo New PATH is: $PATH
      end
    else
      if isatty
        echo Entry already exists in fish_user_paths: $path
      end
    end
  end
end
