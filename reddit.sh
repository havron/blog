#!/bin/bash
# Convert this to python, reddit API depends on a python module import!

# Include postname as lower-case and underscores (could write function to convert automatically)
POSTNAME=$1
SUBREDDIT=havronxyz
# write reddit API to automate link submission here with oAuth


# look at https://github.com/reddit/reddit/wiki/JSON to try to get the ID of a post...
ID=???

# grab JSON data from the oEmbed endpoint, store in /data/
# curl triggers a bot warning, so use wget...
wget https://www.reddit.com/oembed?url=https://www.reddit.com/r/$SUBREDDIT/comments/$ID/$POSTNAME/
# put it /data/ .... write layout/partials/reddit.html and load variables there 
# and in /layout/_defaults/single.html 
