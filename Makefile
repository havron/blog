.PHONY: clean blog_github full_github dev html
THEME=hugo-bootswatch
# NOTE: the two github targets assume a specific development environment!
# Namely, that this repo is located at ~/blog and that the public_web repo 
# is located at ~/public_web in the filesystem of the dev environment. 
# the html produced by Hugo is intended to be synchronized 
# with the public_web repo's /blog directory, thus all 
# of the hoopla with removing and copying files and whatnot.
dev:
	hugo server --theme=$(THEME) --watch

html:
	hugo --theme=$(THEME)

blog_github:
	# possible execution call to reddit automation script
	rm -rf public/
	hugo --theme=$(THEME)
	rm -rf ~/public_web/blog/* # env specific
	cp -r public/* ~/public_web/blog/ # env specific
	git add -A
	git commit -m "Rebuilt site"
	git push

full_github: blog_github
	cd ~/public_web/ && \
	git add -A && \
	git commit -m "Rebuilt site blog" && \
	git push
