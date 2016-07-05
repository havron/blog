.PHONY: clean blog_github full_github dev html
THEME=hugo-bootswatch

dev:
	hugo server --theme=$(THEME) --watch

html:
	hugo --theme=$(THEME)

blog_github:
	# possible execution call to reddit automation script
	rm -rf public/
	hugo --theme=$(THEME)
	rm -rf ~/public_web/blog/*
	cp -r public/* ~/public_web/blog/
	git add -A
	git commit -m "Rebuilt site"
	git push

full_github: blog_github
	@ cd ~/public_web/ && \
	git add -A \
	git commit -m "Rebuilt site blog" \
	git push
