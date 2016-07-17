watch:
	make rebuild
	watchmedo shell-command \
		--patterns="*.md" \
		--ignore-directories \
		--command='noterender one --src="$${watch_src_path}" --dst=build' \
		--recursive \
		--drop \
		.

rebuild:
	@mkdir -p build
	@rm -r build
	@noterender --src='.' --dst='build'

setup:
	pip install watchdog
