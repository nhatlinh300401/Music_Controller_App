#!/usr/bin/env bash

# cd to main level of repo
SCRIPT_DIR=$(pwd)
cd $(dirname ${SCRIPT_DIR})

# remove any altered migrations directories and re-check them out
echo "### ALERT: removing migrations files"
while read line; do
  echo "    - ${line}"
  rm -rf $line
done < <(find $(pwd) -type d \( -name venv -o -name .venv -o -path name \) -prune -false -o -name "migrations")

# remove database
rm -rf "./db.sqlite3"

exit 0;