watch:
	watchmedo shell-command \
		--patterns="*.md" \
		--ignore-directories \
		--command="make render" \
		--recursive \
		--drop \
		.

render:
	@mkdir -p build
	@rm -r build
	@noterender --src='.' --dst='build'

setup:
	pip install watchdog
