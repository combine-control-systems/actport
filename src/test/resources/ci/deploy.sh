#!/bin/sh

# Get the full message associated with this tag
message="$(git for-each-ref refs/tags/$TAG_NAME --format='%(contents)')"

# Get the title and the description as separated variables
name=$(echo "$message" | head -n1)
description=$(echo "$message" | tail -n +3)
description=$(echo "$description" | sed ':a;N;$!ba;s/\n/\\n/g')

# Create release
release_token=$(curl -H "Authorization:token $GITHUB_TOKEN" --data \
"{\"tag_name\": \"$TAG_NAME\", \
\"name\": \"$name\", \
\"body\": \"$description\", \
\"draft\": true, \
\"prerelease\": false}" \
 https://api.github.com/repos/combine-control-systems-ab/actport/releases)

# Extract upload_url from release token
upload_url=$(echo "$release_token" | jq -r ".upload_url" | cut -d"{" -f1)

# Upload artifact
curl -XPOST -H "Authorization:token $GITHUB_TOKEN" \
-H "Content-Type:application/octet-stream" \
--data-binary @$RELEASE \
${upload_url}?name=$(basename $RELEASE)
