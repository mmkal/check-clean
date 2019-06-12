STATUS=$(git status --porcelain)
RED='\033[0;31m'
NC='\033[0m' # No Color
if [ -z "$STATUS" ]; then
  exit 0
else
  printf "${RED}error: git changes detected.\n"
  printf "${RED}check them in locally before running again.\n"
  if [ "$1" ]; then
    printf "${NC}additional info: $1\n"
  fi
  printf "${NC}changes:\n$STATUS\n"
  exit 1
fi
