A commandline interface to Icinga2
==================================
# Dependencies
- curl
- jq

# Install
1. Symlink the jira binary to your $PATH, e.g.
   ln -s /usr/local/share/icinga-cli/icinga /usr/local/bin/icinga
   or
   ln -s /~/somewhere/icinga-cli/icinga $HOME/bin/icinga
2. Optional, copy/symlink shell-completions to your completions dir

# Config
Place a default config into ~/.config/icinga.env:
```
ICINGA_URL='https://your-icinga.server.example.org'
# optional user/pass for automatic login
ICINGA_USER=some-user
ICINGA_PASS=some-password
```
