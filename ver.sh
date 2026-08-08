#!/bin/sh

t=`date`
h=`hostname`
u=${USER:-root}

st=`git status`

git=`git rev-parse --verify --short=7 HEAD 2>/dev/null`

repo=`git remote get-url origin | sed 's/.*\///;s/\..*//'`

git_b=`git rev-parse --abbrev-ref HEAD`
if [ -n "$git_b" ] ; then
git="${git}(${git_b})"
fi

verinfo="${repo} ${git} ${t}"

cat << EOF > version.h
"${verinfo}"
EOF
