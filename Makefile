MAKEFLAGS += --always-make

# :: Silences `make` echo-ing your commands by default.
#                Suppress this behavior by defining the `VERBOSE` variable when running `make`:
#
#                  $ make VERBOSE=1 clean
#
ifndef VERBOSE
	MAKEFLAGS += --silent
endif

PROJECT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

# :: ---

all:
	@echo $(PROJECT_DIR)

start:
	docker compose															\
		-f $(PROJECT_DIR)/docker-compose.yaml			\
		-f $(PROJECT_DIR)/resources/adguard.yaml	\
		up -d

stop:
	docker compose															\
		-f $(PROJECT_DIR)/docker-compose.yaml			\
		-f $(PROJECT_DIR)/resources/adguard.yaml	\
		down
