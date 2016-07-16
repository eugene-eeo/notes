watch:
	watchmedo shell-command \
		--patterns="*.md" \
		--ignore-directories \
		--command="make render" \
		--recursive \
		--drop \
		.

render:
	@rm -r build
	@mkdir build
	@noterender --src='.' --dst='build'

setup:
	pip install watchdog
	mkdir build
