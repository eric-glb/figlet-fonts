.PHONY: help test install examples

help:
	@echo "\nUSAGE:\n"
	@echo "  make help    : print this help"
	@echo "  make test    : check if \`figlet\` is in the \$$PATH"
	@echo "  make install : install figlet + figlet-fonts"
	@echo "  make examples: Regenerate Examples.md\n"

test:
	@which figlet >/dev/null 2>&1 && echo "Figlet is present" || echo "Figlet missing."

install:
	@test -r /etc/redhat-release && sudo yum install -y figlet >/dev/null     || :
	@test -r /etc/debian_version && sudo apt-get install -y figlet >/dev/null || :
	@sudo mkdir -p /usr/share/figlet 2>/dev/null                              || :
	@sudo cp -v ./figlet/* /usr/share/figlet/

examples:
	@echo "Create Examples.md"
	@echo "Examples\n===\n\nExamples of the available fonts using the font name for the text." > Examples.md
	@IFS=$$(echo -en "\n\b")
	@for file in figlet/*.flf; \
	do \
	  font=$$(basename "$$file"); \
	  echo "\n\n$$font\n---\n"; \
	  echo "\`\`\`"; \
	  figlet -w 220 -f "$$file" "$${font%.flf}" | grep -v '^\s*$$'; \
	  echo "\`\`\`"; \
	done >> Examples.md
