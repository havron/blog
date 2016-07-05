THEME = hugo-bootswatch

html:
	# possible execution call to reddit automation script
	hugo --theme=$(THEME)

develop:
	hugo server --theme=$(THEME) --watch

.PHONY: html clean develop
