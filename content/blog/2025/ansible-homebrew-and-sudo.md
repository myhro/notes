---
title: Ansible, Homebrew and sudo
date: 2025-10-11
---

I'm not sure since when this started happening, given that I only upgraded from (and did not reinstall) macOS 14 Sonoma to macOS 15 Sequoia. However, I noticed the issue in a fresh macOS 26 Tahoe installation. Whenever I tried to install a Homebrew Cask, either via Ansible or directly using `brew install`, I got an error like the following:

```
Error: Failure while executing; /usr/bin/sudo -u root -E LOGNAME=myhro USER=myhro USERNAME=myhro -- /usr/sbin/installer -pkg /opt/homebrew/Caskroom/cloudflare-warp/2025.8.779.0/Cloudflare_WARP_2025.8.779.0.pkg -target / exited with 1. Here's the output:
sudo: a terminal is required to read the password; either use the -S option to read from standard input or configure an askpass helper
sudo: a password is required
```

Using the suggested `-S` option didn't work either:

```
Error: Failure while executing; `/usr/bin/sudo -u root -A -E LOGNAME=myhro USER=myhro USERNAME=myhro -- /usr/sbin/installer -pkg /opt/homebrew/Caskroom/cloudflare-warp/2025.8.779.0/Cloudflare_WARP_2025.8.779.0.pkg -target /` exited with 1. Here's the output:
sudo: unable to run /usr/libexec/ssh-askpass: No such file or directory
sudo: no password was provided
sudo: a password is required
```

I then thought, "Well, I'll just allow `/usr/sbin/installer` to not require a sudo password." Still, that wasn't enough:

```
Error: Failure while executing; `/usr/bin/sudo -u root -A -E LOGNAME=myhro USER=myhro USERNAME=myhro -- /usr/sbin/installer -pkg /opt/homebrew/Caskroom/cloudflare-warp/2025.8.779.0/Cloudflare_WARP_2025.8.779.0.pkg -target /` exited with 1. Here's the output:
sudo: sorry, you are not allowed to preserve the environment
```

The solution was to allow `/usr/sbin/installer` both to skip the password requirement and to preserve environment variables:

```
$ cat /etc/sudoers.d/01-users
myhro ALL=(ALL) NOPASSWD:SETENV: /usr/sbin/installer
```
