#!/bin/bash
function help {
  if [[ $1 ]]; then
    extended_help $1
    exit $EX_SUCCESS
  fi
printf "homes${bldblu}h${txtdef}ick uses git in concert with symlinks to track your precious dotfiles.

Usage:
  homeshick cd <castle>
  homeshick clone [-fhq] <uri>...
  homeshick generate [-hq] <castle>...
  homeshick list [-h]
  homeshick check [-hq] [<castle>...]
  homeshick refresh [-bhq] [--days=<days>] [<castle>...]
  homeshick pull [-bhq] [<castle>...]
  homeshick link [(-f|-s)] [-bhq] [<castle>...]
  homeshick track [-fbhq] <castle> <file>...
  homeshick -h | --help

Options:
  -f --overwrite   Overwrite files that already exist
  -s --skip        Skip files that already exist
  -b --batch       Batch-mode: Skip interactive prompts / Choose the default
  -h --help        Show description and usage of invoked command
  -q --quiet       Suppress status output
  -d --days        Refresh threshold [default: 7]

Note:
  To check, refresh, pull or symlink all your castles
  simply omit the CASTLE argument
"
}

function help_err {
	extended_help $1
	exit $EX_USAGE
}

function extended_help {
	case $1 in
		cd)
      printf "Enters a castle's directory.\n\n"
      printf "Usage:\n  homeshick cd <castle>\n\n"
      printf "Note:\n  For this to work, homeshick must be invoked via homeshick.{sh,csh,fish}.\n"
      ;;
		clone)
      printf "Clones URI as a castle for homeshick\n\n"
      printf "Usage:\n  homeshick clone [-fhq] <uri>...\n"
      ;;
		generate)
      printf "Generates a repo prepped for usage with homeshick\n\n"
      printf "Usage:\n  homeshick generate [-hq] <castle>...\n"
      ;;
    list)
      printf "Lists cloned castles\n\n"
      printf "Usage:\n  homeshick list [-h]\n"
      ;;
    check|updates)
      printf "Checks if a castle has been updated on the remote\n\n"
      printf "Usage:\n  homeshick check [-hq] [<castle>...]"
      ;;
    refresh)
      printf "Checks if a castle has not been pulled in DAYS days.\n\n"
      printf "The default is one week.\n"
      printf "Usage:\n  homeshick refresh [-bhq] [--days=<days>] [<castle>...]\n"
      ;;
    pull)
      printf "Updates a castle. Also recurse into submodules.\n\n"
      printf "Usage:\n  homeshick pull [-bhq] [<castle>...]\n"
      ;;
    link|symlink)
      printf "Symlinks all dotfiles from a castle\n\n"
      printf "Usage:\n  homeshick link [(-f|-s)] [-bhq] [<castle>...]\n"
      ;;
    track)
      printf "Adds a file to a castle. "
      printf "This moves the file into the castle and creates a symlink in its place.\n"
      printf "Usage:\n  homeshick track [-fbhq] <castle> <file>...\n"
      ;;
		*)    help  ;;
		esac
	printf "\n\n"
}
