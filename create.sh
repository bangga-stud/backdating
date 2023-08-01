#!/bin/bash

filedate="aug-23"
for day in {1..31}; do
  # Generate a random number between 1 and 8 for the current day
  ranNum=$(( RANDOM % 8 + 1 ))

  for (( x=1; x<=$ranNum; x++ )); do
    # Generate a filename based on the current date and iteration
    filename="$day-$filedate-$x.js"

    # Create the file with content "console.log('hello world');"
    echo "console.log('hello world');" > "$filename"

    # Add the file to the Git staging area
    git add .
    sleep 1

    # Set the Git committer date and time for the commit
    commit_date="2023-08-"$day" 09:00:00"
    GIT_COMMITTER_DATE="$commit_date" git commit -m "Commit on $day-$filedate" --date "$commit_date" --no-edit

    sleep 2
  done
done

# Push changes to the remote repository
git push --force