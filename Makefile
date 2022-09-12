# Author: Nic Cantieni
# Date: 04.09.2022


NAME = texlive-docker
VERSION = v1.0.1

BUILDER = podman

DOCKERFILE = Dockerfile

BUILD = $(BUILDER) build . --tag $(NAME):$(VERSION) --file $(DOCKERFILE)

.PHONY: build
build :
	$(BUILD)

.PHONY: nocache
nocache :
	$(BUILD) --no-cache

.PHONY: save
save :
	$(BUILDER) image save -o $(NAME).tar $(NAME):$(VERSION)

.PHONY: clean
clean :
	rm $(NAME).tar
