# The project directory.
proj_dir = "starter"

# The test directory.
test_dir = "test"

# The minimum test coverage before the build fails.
min_test_cov = "85"

##
# Install dependencies using pip.
##
deps:
	pip install -r requirements.txt

##
# Freezes dependencies to requirements.txt.
##
deps-freeze:
	pip freeze > requirements.txt

##
# Formats the project and test code using the black formatter.
##
format:
	black ${proj_dir} && black ${test_dir}

##
# Lints the project and test directory.
#
# N.B - Asserts Google docstrings on the project directory, but not the test directory.
##
lint:
	flake8 ${proj_dir} --docstring-convention=google && \
	flake8 ${test_dir} --extend-ignore D

##
# Security checks the project.
##
security:
	safety check -r requirements.txt && \
	bandit -r ${proj_dir}

##
# Runs the tests in the test directory using pytest.
##
test:
	pytest --cov=${proj_dir} --cov-fail-under ${min_test_cov} ${test_dir}

##
# Runs the entire build toolchain.
##
build: format lint security test


.PHONY: deps deps-freeze format lint security test build