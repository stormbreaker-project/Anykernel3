NAME ?= StormBreaker-Kernel
DATE := $(shell date "+%d%m%Y-%I%M")
VERSION := $(KERN_VER)
DEVICE := $(DEVICE)

ZIP := $(NAME)-$(VERSION)-$(DEVICE)-$(DATE).zip

EXCLUDE := Makefile *.git* *.jar* Storm* *placeholder*

zip: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(SZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."
	
clean:
	@rm -vf *.zip*
	@rm -vf zImage
	@echo "Done."
