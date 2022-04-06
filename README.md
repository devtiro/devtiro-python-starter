# Devtiro Python Starter
An opinionated starter for quickly getting Python projects up and running.

## Toolchain
This is the sequence of tools run on `make build`:

#### 1. Format: `black`
The [black](https://github.com/psf/black) code formatter automatically formats Python 
code using an opinionated, but largely PEP8 compliant style.

Why bother? 🤷 Because life is too short to worry about code style minutiae for every 
single project.  

Plus the code looks pretty good after formatting 🙌.

Applied to project and test code.

Can be run independently using using `make format`. 

#### 2. Lint: `flake8`
The tool "flake8" enforces PEP8 compliant code style across the codebase. Stray away 
from PEP8 and the build will fail 💥.

To be [compatible with Black](https://black.readthedocs.io/en/stable/guides/using_black_with_other_tools.html#flake8)
the line length and a few other tweaks have been placed in the `.flake8` configuration
file. 
 
The plugin `flake8-docstrings`(https://pypi.org/project/flake8-docstrings/) is used to 
check for [Google style](https://google.github.io/styleguide/pyguide.html) docstrings.

Tools flake8 with the docstring plugin are run against the project code, but only flake8 
*without the docstring plugin* is run against test code.

Can also be run through `make lint`.  

#### 3. Security Check Dependencies: `safety`
["Vulnerable and Outdated Components"](https://owasp.org/Top10/A06_2021-Vulnerable_and_Outdated_Components/) 
is entry #6 in the 2021 OWASP Top Ten.

The [safety](https://pypi.org/project/safety/) project goes some way to reduce this risk
by checking the project's installed dependencies for known security vulnerabilities.

The build will fail if the project contains a known vulnerability 💥.

Can also be run through `make security`.

#### 4. Security Check Code: `bandit`
The tool `bandit` scans the project code to find common security issues. 

If a common security issue is found, then the build will fail 💥. 

Can also be run through `make security`.

#### Tests: `pytest`
The pytest framework makes it easy to write small, readable tests. That's exactly what
we want 🎉.

The plugin [pytest-cov](https://pypi.org/project/pytest-cov/) is used to generate test 
reports. There's a variable `min_test_cov` in the Makefile which is current set to 
`85`(%).  

If a test fails or the test coverage drops below the value of `min_test_cov`, then the 
build will fail 💥.

Can also be run through `make test`.