#!/bin/bash -e

detect_changed_languages() {
  echo "detecting changes for this build"
  languages=`git diff --name-only $SHIPPABLE_COMMIT_RANGE | sort -u | awk 'BEGIN {FS="/"} {print $1}' | uniq`

  echo $SHIPPABLE_COMMIT_RANGE

  for language in $languages
  do
    unset changed_components
    detect_changed_folders $language
    run_install
  done
}

detect_changed_folders() {
  folders=`git diff --name-only $SHIPPABLE_COMMIT_RANGE | sort -u | grep $1 | awk 'BEGIN {FS="/"} {print $2}' | uniq`

  push_all_images=false
  for folder in $folders
  do
    if [ "$folder" == '_global' ]; then
      echo "pushing all images"
      push_all_images=true
      break
    fi
  done

  if [ "$push_all_images" == true ]; then
    cd $1
    export changed_components+=`ls -d */ | sed 's/.$//'`
    cd ..
  else
    export changed_components+=$folders
  fi
}

run_install() {
  for component in $changed_components
  do
    if [ "$component" != '_global' ] && [ "$component" != 'node_modules' ]; then
      execute_install $component
    fi
  done
}

execute_install() {
  if [[ -z "$1" ]]; then
    return 0
  else
    echo "installing dependencies for $1"
    base=/root/src/github.com/ttrahan/micro-mono
    cd $base/$language/$1
    npm install
  fi
}

if [ "$IS_PULL_REQUEST" != true ]; then
  detect_changed_languages
  # tag_and_push_changed_components
else
  echo "skipping because it's a PR"
fi
