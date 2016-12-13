
.PHONY: all build test tag_latest release ssh

all: baseos baseservice refinedservice appservice

baseos:
	@$(MAKE) -C ./alpine/3.4 all
	@$(MAKE) -C ./alpine/edge all

baseservice:
	@$(MAKE) -C ./ruby all
	@$(MAKE) -C ./java all
	@$(MAKE) -C ./redis all
	@$(MAKE) -C ./nginx all
	@$(MAKE) -C ./nginx-php7 all

refinedservice:
	@$(MAKE) -C ./fakes3 all
	@$(MAKE) -C ./fakesqs all
	@$(MAKE) -C ./languagetool all
	@$(MAKE) -C ./phpredisadmin all
	@$(MAKE) -C ./nginx-php7-office all

appservice:
	@$(MAKE) -C ./wpt-backend all

