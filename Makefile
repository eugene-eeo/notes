watch:
	make rebuild
	watchmedo shell-command \
		--ignore-directories \
		--patterns="*.md" \
		--command='noterender one --src="$${watch_src_path}" --dst=build' \
		--drop \
		notes

rebuild:
	@mkdir -p build
	@rm -r build
	@noterender --src='notes/' --dst='build/'

setup:
	pip install watchdog
