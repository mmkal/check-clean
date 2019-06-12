set -e

# this script will fail if there are working copy changes!
./check-clean.sh

touch not-checked-in.txt

CHANGE_CAUSED_FAILURE=false
./check-clean.sh || CHANGE_CAUSED_FAILURE=true
rm not-checked-in.txt

if [ $CHANGE_CAUSED_FAILURE = "true" ]; then
  echo "change caused a failure as expected, hooray."
else
  echo "change should have caused a failure"
  exit 1
fi

./check-clean.sh
