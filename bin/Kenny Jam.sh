#!/bin/sh
echo -ne '\033c\033]0;Kenny Jam\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Kenny Jam.x86_64" "$@"
