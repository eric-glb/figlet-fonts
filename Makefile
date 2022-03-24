test:
	@which figlet >/dev/null 2>&1 2>&1 && echo "Figlet is present" || echo "Figlet missing."

install:
	@test -r /etc/redhat-release && sudo yum install figlet >/dev/null     || return 0
	@test -r /etc/debian_version && sudo apt-get install figlet >/dev/null || return 0
	@sudo mkdir -p /usr/share/figlet 2>/dev/null                           || return 0
	@sudo cp ./figlet/* /usr/share/figlet/
