# XSSDriver
Drives the browser to check for XSS popups and alert on valid payloads.

When BurpSuite alerts on XSS in a GET request, this script automates the process of injecting XSS payloads (SecLists is a good source) into the browser and checking for the existence of a popup. The script alerts on the payload used that triggers a popup.

Requirements:

Firefox browser

Watir gem: 'gem install watir'

Geckodriver: Mac - 'brew install geckodriver' or download from https://github.com/mozilla/geckodriver/releases


Usage:

ruby XSSDriver.rb /path/to/xsspayloads https://URL2Test/paramsFUZZ

XSSDriver will add payloads in place of 'FUZZ'.
