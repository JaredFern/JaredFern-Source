#!/bin/bash
for i in "$@"
do
case $i in
    -m=*|--message=*)
    MESSAGE="${i#*=}"
    ;;
    *)
    ;;
esac
done

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
git commit -m "$MESSAGE"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..

git add .
git commit -m "$MESSAGE"
git push
