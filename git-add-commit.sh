#!/bin/bash

git_add_commit_push() {
  git add.
  echo Enter Message:
  read message
  git commit -m $message
  git push
}

git_add_commit() {
  git add .
  echo Enter Message:
  read message
  git commit -m $message
}


git_push() {
  git push
}

git_push() {
  git status
}


git_workflow() {
  let GIT_ADD_COMMIT_PUSH=1
  let GIT_ADD_COMMIT=2
  let GIT_PUSH=3
  let GIT_STATUS=4


  echo "Choose git option: "
  echo "1 - git add, commit and push"
  echo "2 - git add, commit"
  echo "3 - git push"
  echo "4 - git status"

  read git_option;
  case $git_option in
    $GIT_ADD_COMMIT_PUSH) 
      git_add_commit_push;;
    $GIT_ADD_COMMIT)
      git_add_commit;;
    $GIT_PUSH)
      git_push;;
    $GIT_STATUS)
      git_status;;
    *) 
      echo "Invalid Git Option";; 
  esac
}

git_workflow

