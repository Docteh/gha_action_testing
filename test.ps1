param($BUILD_NAME)

$GITDATE = $(git show -s --date=short --format='%ad') -replace "-", ""
$GITREV = $(git show -s --format='%h')

$GITSHA = $(git show -s --format='%H')
if ("$GITSHA" -ne $env:GITHUB_SHA) {
    echo "two hashes don't match, come back to this section later"
} else {
    echo "two hashes do match"
}
echo "$env:GITHUB_SHA $GITREV"




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
    echo "printing out a good chunk of env for testing purposes"
    echo "GITHUB_ACTION: $env:GITHUB_ACTION"
    echo "GITHUB_ACTION_REPOSITORY: $env:GITHUB_ACTION_REPOSITORY"
    echo "GITHUB_ACTOR: $env:GITHUB_ACTOR"
    echo "GITHUB_BASE_REF: $env:GITHUB_BASE_REF"
    echo "GITHUB_HEAD_REF: $env:GITHUB_HEAD_REF"
    echo "GITHUB_REF: $env:GITHUB_REF"
    echo "GITHUB_REF_NAME: $env:GITHUB_REF_NAME"
    echo "GITHUB_REF_TYPE: $env:GITHUB_REF_TYPE"
    echo "GITHUB_SHA: $env:GITHUB_SHA"
    echo "GITHUB_WORKFLOW: $env:GITHUB_WORKFLOW"
    echo "RUNNER_ARCH: $env:RUNNER_ARCH"
    echo "RUNNER_NAME: $env:RUNNER_NAME"
    echo "RUNNER_OS: $env:RUNNER_OS"
}


# yuzu-msvc-verify-pr9203-date-date
dir
mkdir artifacts
cp *.jpg artifacts
# will this cause a failure?
cp *.gif artifacts
echo "no whammy?"
