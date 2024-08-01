---
title: Changing a Linux hostname
date: 2024-08-01
---

I’m always unsure whenever I have to change the hostname of a Linux machine. Even though it is a simple process, it brings up many questions. Is it done using the `hostname` command? Is it by editing the `/etc/hostname` file? If so, how do you reload it after editing? Why is it lost after a reboot?

The answer for Linux distributions based on systemd (nearly all of them) is to use [hostnamectl][hostnamectl]:

    $ sudo hostnamectl hostname foo

This will update the `/etc/hostname` file properly and ensure the setting isn’t lost on the next reboot.

P.s.: apparently, [the command used to be][rh-guide] `hostnamectl set-hostname`, but these days `hostnamectl hostname` will suffice.

[hostnamectl]: https://www.freedesktop.org/software/systemd/man/latest/hostnamectl.html
[rh-guide]: https://www.redhat.com/sysadmin/configure-hostname-linux
