#!/bin/bash
# Sam Havron
# NOTE: to be used in conjunction with Makefile, 
# which handles year directories and calls this script
# at the proper time in deployment
for y in ~/blog/content/post/*/ 
do
  if [ -d "${y}" ]; then
    # get the years by finding aptly-named directories 
    # in the blog's source markdown content
    year=`echo $y | grep -Eo '[^/]+/?$' | cut -d / -f1` 

    if [ ! -d "public/$year/raw" ]; then
    mkdir public/$year/raw # assumes public and $year are created already! Makefile does this.
    fi

    # take all Markdown posts, strip the TOML frontmatter, and store them in raw/
    # then make a converted copy from .md to .txt with pandoc
    for v in content/post/$year/*.md
    do 
      bn=`basename -s .md $v`
      sed '1,/+++/d' $v > public/$year/raw/$bn.md
      pandoc -t markdown -o public/$year/raw/$bn.md public/$year/raw/$bn.md
      pandoc --reference-links -t plain -o public/$year/raw/$bn.txt public/$year/raw/$bn.md
    done
  fi
done
