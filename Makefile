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

all: clean podman

clean:
	rm -f $(PROJECT_DIR)/podman-compose.yaml

podman:
	if ! [ -x "$$(command -v yq)" ]; then \
		wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 \
			-O /usr/bin/yq && \
    	chmod +x /usr/bin/yq; \
	fi

	yq eval-all '. as $$item ireduce({}; . * $$item)' \
		$(PROJECT_DIR)/docker-compose.yaml \
		$(PROJECT_DIR)/resources/*.yaml > $(PROJECT_DIR)/podman-compose.yaml
