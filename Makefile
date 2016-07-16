.PHONY: clean new blog_github full_github dev html
THEME=hugo-bootswatch
MSG=Rebuilt site blog
N=default.md
Y=`date +"%Y"`
S=post/${Y}
BN=`basename -s .md ${N}`
# NOTE: the two github targets assume a specific development environment!
# Namely, that this repo is located at ~/blog and that the public_web repo 
# is located at ~/public_web in the filesystem of the dev environment. 
# the html produced by Hugo is intended to be synchronized 
# with the public_web repo's /blog directory, thus all 
# of the hoopla with removing and copying files and whatnot.
dev:
	hugo server --theme=$(THEME) --watch

# 1337 h4x0r way to get archetypes to obey set priorities in TOML frontmatter. mwahaha ;)
# See https://github.com/spf13/hugo/issues/452#issuecomment-231558158
new:
	hugo new ${S}/${N} && \
	sed -i '/^date/!s/^.*-//' content/${S}/${N} && \
	sed -i "s/\"*.md/\"${BN}/" content/${S}/${N}
	vi +10 content/${S}/${N} # get straight to editing! I ran this target for a reason 💁

html:
	rm -rf public/
	hugo --theme=$(THEME)
	./plainify.sh

blog_github:
	# possible execution call to reddit automation script
	rm -rf public/
	hugo --theme=$(THEME)
	./plainify.sh
	rm -rf ~/public_web/blog/* # env specific
	cp -r public/* ~/public_web/blog/ # env specific
	git add -A
	git commit -m "${MSG}"
	git push

full_github: blog_github
	cd ~/public_web/ && \
	git add -A && \
	git commit -m "${MSG}" && \
	git push
