default: rebuild watch

watch:
	watchmedo shell-command \
		--ignore-directories \
		--patterns="*.md" \
		--command='noterender' \
		--drop \
		notes

rebuild:
	@rm -rf build
	noterender

setup:
	pip install watchdog

DIR = ~/code/website/notes

deploy:
	make rebuild
	./compress.sh
	genhtmlindex build/ > build/index.html
	cp ./build/* ${DIR}
