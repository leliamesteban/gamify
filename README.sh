#!/bin/bash

if [[ $# -gt 0 ]]
then
  cat <<< "$(jq '.mode |= "window"' < app/settings.json)" > app/settings.json
  echo "Running in" $(jq '.mode' < app/settings.json) "mode"
  echo "Generating the HTML files\n"
  npx eleventy && \
  echo Running the application
  netlify dev
fi
