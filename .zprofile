# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.

# Removed alias, since using zsh.
# Now sourced from ~/.oh-my-zsh/custom/aliases.zsh after other zsh aliases
# I had a conflict and wanted/needed to override what zsh was doing
for file in ~/.{path,exports,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && echo "Sourcing $file" && source "$file";
done;
unset file;
