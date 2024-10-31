# az-sso-creds-helper:
# When using az sso login on az CLI v2 as of July 27th, 2020,
# the credentials are stored so they will work with the CLI itself (v2) but don't work on the az SDKs and other tools that expect credentials to be readable from ~/.az/credentials (v1).
# This package aims to streamline updating the az credentials file for az SSO users by updating/creating the corresponding profile section in ~/.az/credentials with temporary role credentials.

.PHONY: az/cli/install
## Install az Command Line Interface v2
az/cli/install: 
	@curl -L https://aka.ms/InstallAzureCli | bash

.PHONY: az/cli/autocomplete
az/cli/autocomplete:
	@echo "complete -C '/usr/local/bin/az_completer' az" | tee --append ~/.bashrc
	@echo "complete -C '/usr/local/bin/az_completer' az" | tee --append ~/.zshrc

.PHONY: az/cli/version
## Display az CLI version
az/cli/version:
	@echo "--- az CLI ---"
	@az --version

.PHONY: az/cli/upgrade
## Display az CLI version
az/cli/upgrade:
	@echo "--- az upgrade ---"
	@az upgrade