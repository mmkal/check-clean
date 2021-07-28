git diff --exit-code || (echo 'Git changes detected. Stage, commit, stash or discard your changes before re-running.' && exit 1)
