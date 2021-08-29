#!Make
DENO=deno
BUNDLE=$(DENO) bundle
RUN=$(DENO) run
TEST=$(DENO) test
FMT=$(DENO) fmt
LINT=$(DENO) lint
BUILD=${DENO} compile
DEPS=${DENO} info
DOCS=${DENO} doc main.ts --json
INSPECT=${DENO} run --inspect
BINARY_NAME=bombardierd
VERSION=0.0.1
DESCRIPTION=Benchmark tool for testing endpoint
AUTHOR=stephendltg
DENOV=1.13.2
BOMBARDIER=v1.2.5

install: 
	@echo "Installing project ${BINARY_NAME}..."
	curl -fsSL https://deno.land/x/install/install.sh | sh
	deno upgrade --version ${DENOV}
  
version:
	@echo "Version Deno ..."
	$(DENO) --version

upgrade:
	@echo "Update Deno ..."
	$(DENO) upgrade

tool:
	@echo "Deno tools ..."
	${DEPS}
	${FMT}
	${LINT} --unstable

start:
	@echo "Deno start bundle ..."
	deno run --allow-all --unstable bin/${BINARY_NAME}.bundle.js

dev:
	@echo "Deno dev ..."
	deno run --allow-all --unstable --watch ${BINARY_NAME}.ts
  
bundle:
	@echo "Deno bundle ..."
	${BUNDLE} --unstable ${BINARY_NAME}.ts bin/${BINARY_NAME}.bundle.js

clean:
	@echo "Deno cleaning ..."
	rm -f ${BINARY_NAME}.bundle.js

inspect:
	@echo "Deno inspect ..."
	@echo "Open chrome & chrome://inspect"
	${INSPECT} --allow-all --unstable ${BINARY_NAME}.ts

env:
	@echo "Binary name: $(BINARY_NAME)"
	@echo "Version: $(VERSION)"
	@echo "Description: $(DESCRIPTION)"
	@echo "Homepage: $(HOMEPAGE)"
	@echo "Author: $(AUTHOR)"
	@echo "Hugo: $(BOMBARDIER)"
	@echo "Deno: ${DENOV}"
