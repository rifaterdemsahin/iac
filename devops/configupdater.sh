#!/bin/bash
git checkout -b master
echo 'This is a test' > data.txt
git add -A
git commit -m "deployment $(Build.BuildNumber)"
git push --set-upstream origin master