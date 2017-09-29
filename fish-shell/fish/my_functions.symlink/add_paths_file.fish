function add_paths_file -d "Add paths from a file in bash or fish form."
  # Expecting a file in the first argument (non-zero indexed)
  set -l file $argv[1]
  if string match -rq '.zsh$' $file
    # echo Found zsh file $file
    # Adjust possible bash or zsh syntax issues here
  end
  for line in (cat $file)
    # add_path $line
  end
end
