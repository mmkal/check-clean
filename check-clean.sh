STATUS=$(git status --porcelain)
# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color
if [ -z "$STATUS" ]; then
  exit 0
else
  printf "${RED}error: git changes detected.\n"
  if [ "$CI" = "true" ]; then
    printf "${YELLOW}this was run in a CI environment, you probably don't want changes to have been generated here. Try to reproduce this locally, and check the changes in before re-running in CI$NC.\n"
  else
    printf "${RED}check them in before running again$NC.\n"
  fi

  if [ "$1" ]; then
    printf "${NC}additional info: $1\n"
  fi
  printf "${NC}changes:\n$STATUS\n"
  exit 1
fi
