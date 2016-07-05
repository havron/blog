.PHONY: clean html dev
THEME=hugo-bootswatch


dev:
	hugo server --theme=$(THEME) --watch

github_test:
	# possible execution call to reddit automation script
	git add -A
	git commit -m "Rebuilt site"
	git push

github:
	# possible execution call to reddit automation script
	rm -rf public/
	hugo --theme=$(THEME)
	rm -rf ~/public_web/blog/*
	cp -r public/* ~/public_web/blog/
	git add -A
	git commit -m "Rebuilt site"
	git push
