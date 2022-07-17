param($BUILD_NAME)

$GITDATE = $(git show -s --date=short --format='%ad') -replace "-", ""
$GITREV = $(git show -s --format='%h')

# Write out a tag for later steps (Probably Upload)
# We're getting ${{ github.event.number }} as $env:PR_NUMBER"
$PR_NUMBER = $env:PR_NUMBER.Substring(2) -as [int]
$PR_NUMBER_TAG = "pr"+([string]$PR_NUMBER).PadLeft(5,'0')
if ("$env:PR_NUMBER" -eq "pr"){
    $env:PR_NUMBER = "manual"
    echo "BUILD_TAG=manual-$GITDATE-$GITREV" >> $env:GITHUB_ENV
} else {
    echo "BUILD_TAG=verify-$PR_NUMBER_TAG-$GITDATE-$GITREV" >> $env:GITHUB_ENV
}
echo "PR_NUMBER: $env:PR_NUMBER"

if ("$env:GITHUB_ACTIONS" -eq "true") {
    echo "yolo?"
}


# yuzu-msvc-verify-pr9203-date-date
dir
mkdir artifacts
cp *.jpg artifacts