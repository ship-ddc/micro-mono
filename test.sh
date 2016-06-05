#!/bin/bash -e

detect_changed_languages() {
  echo "detecting changes for this build"
  languages=`git diff --name-only $SHIPPABLE_COMMIT_RANGE | sort -u | awk 'BEGIN {FS="/"} {print $1}' | uniq`

  echo $SHIPPABLE_COMMIT_RANGE

  for language in $languages
  do
    unset changed_components
    detect_changed_folders $language
    run_tests
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

run_tests() {
  for component in $changed_components
  do
    if [ "$component" != '_global' ] && [ "$component" != 'node_modules' ]; then
      execute_unit_tests $component
      execute_code_coverage $component
    fi
  done
}

execute_unit_tests() {
  if [[ -z "$1" ]]; then
    return 0
  else
    echo "running unit tests on $1"
    grunt --gruntfile ./$language/$1
  fi
}

execute_code_coverage() {
  if [[ -z "$1" ]]; then
    return 0
  else
    echo "running code coverage on $1"
    cd ./$language/$1
    ./node_modules/.bin/istanbul cover grunt --gruntfile ./$language/$1 -u tdd
    ./node_modules/.bin/istanbul report cobertura --root ./$language/$1 --dir  ./shippable/codecoverage/
  fi
}

if [ "$IS_PULL_REQUEST" != true ]; then
  detect_changed_languages
  # tag_and_push_changed_components
else
  echo "skipping because it's a PR"
fi
