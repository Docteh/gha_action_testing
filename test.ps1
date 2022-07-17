param($BUILD_NAME)

$GITDATE = $(git show -s --date=short --format='%ad') -replace "-", ""
$GITREV = $(git show -s --format='%h')

# Write out a BUILD_TAG for the later steps (Upload)
echo "BUILD_TAG=$GITREV" >> $env:GITHUB_ENV
echo "wrote out $GITREV to the env file"

echo lol
# ${{ github.event.number }}
# yuzu-msvc-verify-pr9203-date-date
dir
mkdir artifacts
cp *.jpg artifacts