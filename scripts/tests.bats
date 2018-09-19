#!/usr/bin/env bats

# before python 3.4, `python --version` sends output to STDERR rather than STDOUT, so we need `2>&1`

@test "python version" {

  if [[ $PYTHON_VERSION_NUM < "3.4" ]] ; then
    if [[ $PYTHON_VERSION_NUM < "3" ]] ; then
      python --version 2>&1 | grep $PYTHON_VERSION_NUM
    else
      python3 --version 2>&1 | grep $PYTHON_VERSION_NUM
    fi
  else
    python3 --version | grep $PYTHON_VERSION_NUM
  fi
}

@test "dockerize" {
  if [ $DOCKERIZE != "true" ] ; then
    skip "dockerize not installed"
  fi
  dockerize --version
}
