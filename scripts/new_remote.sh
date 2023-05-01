#!/bin/bash
# Run this on a remote server to setup an alt git server

set -e

[[ $# -gt 0 ]] && REPO_NAME="$1" || REPO_NAME='project'
SERVER_DIR="${PWD}/${REPO_NAME}.git"
CODE_DIR="${PWD}/${REPO_NAME}_code"

mkdir -p $SERVER_DIR && cd $SERVER_DIR
git init --bare
HOOK_FILE=hooks/post-receive
echo "#!/bin/bash
cd ${CODE_DIR}
unset GIT_DIR
git pull" > $HOOK_FILE
chmod +x $HOOK_FILE

cd -
git clone $SERVER_DIR $CODE_DIR

echo
echo
echo '@@@@@@@@@@@@@@@@@@@@@@@'
echo '@@                   @@'
echo '@@  !!  DO THIS  !!  @@'
echo '@@                   @@'
echo '@@@@@@@@@@@@@@@@@@@@@@@'
echo '@@'
echo '@@  Run'
echo '@@'
echo "@@      git remote add server ssh://<user>@<hostname/ip>:<port>${SERVER_DIR}"
echo '@@'
echo '@@  to register this as another remote destination for your code.'
echo '@@'
echo '@@'
echo '@@  You can then run'
echo '@@'
echo '@@      git push server'
echo '@@'
echo '@@  on your local machine to sync.'
echo '@@'
echo '@@'
echo '@@  See https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks if you want to build your continuous delivery script.'
echo '@@'
echo '@@'
echo
echo
