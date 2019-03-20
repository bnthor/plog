#!/bin/bash

# Reads default config and utilities
source ~/plog/bin/plog.cfg
source ~/plog/bin/plog_utils.sh

# Reads user config if it exists
if [ -r ~/.plogrc ]; then
    source ~/.plogrc
fi

# Transforms long flags into short ones
for arg in "$@"; do
  shift
  case "$arg" in
    "--title") set -- "$@" "-t" ;;
    "--generate") set -- "$@" "-g" ;;
    "--audio") set -- "$@" "-a" ;;
    *) set -- "$@" "$arg"
  esac
done

# Reads parameters
while getopts 't:g:a' flag; do
    case "${flag}" in
        t) FILENAME="${OPTARG}" ;;
        g) GENERATE='true' ;;
        a) AUDIO='true' ;;
        *) error "Unexpected option ${flag}" ;;
    esac
done

# Base command
if [ $AUDIO ]; then
    COMMAND="sox -d $DIRECTORY/$FILENAME.mp3"
else
    COMMAND="$EDITOR $DIRECTORY/$FILENAME.md"
fi

# If user had set the --generate flag
if [ $GENERATE ]; then
    if type_exists 'pandoc'; then
        COMMAND="pandoc -s -S --toc -c ~/plog/plog.css $DIRECTORY/*.md -o $DIRECTORY/plog.html"
        e_success "Plog generated in $DIRECTORY/plog.html"
    else
        e_error "You need to install pandoc first. With homebrew: 'brew install pandoc'."
        exit 1
    fi
else
    echo "Creating a plog entry..."
fi

# When users launch plog.sh > evaluate the COMMAND
eval $COMMAND