#!/usr/bin/env bash

# From  https://github.com/bewuethr/shellcheck-action/blob/main/runshellcheck

find . \
	-type d -name '.git' -prune \
	-or \
	-type f \( \
	-exec sh -c 'file --brief "$1" \
		  | grep --quiet --extended-regexp \
			"((POSIX|Korn|Bourne-Again) shell|/usr/bin/env k?sh) script"' _ {} \; \
	-or \
	-name '*.sh' -or -name '*.bash' -or -name '*.ksh' \
	\) \
	-exec shellcheck --color=always {} +
