#!/usr/bin/env bats

# before python 3.4, `python --version` sends output to STDERR rather than STDOUT, so we need `2>&1`

@test "python version" {

  python --version | grep -i $PYTHON_VERSION
}

@test "dockerize" {
  if [ $DOCKERIZE != "true" ] ; then
    skip "dockerize not installed"
  fi
  dockerize --version
}
