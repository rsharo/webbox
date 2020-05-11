include functs.mk

# Build parameters
export DOCKER ?= podman
export DOCKER_BUILD ?= buildah bud

IMAGE := webbox
CONTEXT := context
SSH_CONFIG := webbox-ssh-config

PRIVATE_KEY = $(IMAGE:%=id_%)
PUBLIC_KEY = $(PRIVATE_KEY:%=%.pub)

CONTEXT_KEY = $(PUBLIC_KEY:%=$(CONTEXT)/%)
CONFIG_KEY = $(PRIVATE_KEY:%=$(SSH_CONFIG)/%)
KEYFILES = $(PRIVATE_KEY) $(PUBLIC_KEY)

all: install

clean distclean:
	$(RM) $(PUBLIC_KEY:%=$(CONTEXT)/%)
	$(RM) $(KEYFILES:%=$(SSH_CONFIG)/%)

build install:
	@$(call check-new-image,$(IMAGE)) && \
		$(MAKE) $(IMAGE) || \
		echo "$(IMAGE) already exists... not rebuilding"

rebuild: uninstall
	@$(MAKE) $(IMAGE)

uninstall: kill
	$(call clean-image,$(IMAGE))

launch:
	./launch.sh

kill:
	$(call clean-container,$(IMAGE))


$(IMAGE): $(CONTEXT_KEY)
	$(DOCKER_BUILD) -t $@ context/

$(CONTEXT_KEY): $(CONFIG_KEY)
	cp $(CONFIG_KEY:%=%.pub) $(CONTEXT)

$(CONFIG_KEY):
	ssh-keygen -t ecdsa -N '' -f $(CONFIG_KEY)


.PHONY: all clean distclean build rebuild install uninstall launch kill $(IMAGE)
