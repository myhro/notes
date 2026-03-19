---
title: Debian nocloud images on UTM/QEMU
date: 2026-03-19
slug: debian-nocloud-images-on-utm-qemu
---

The `nocloud` flavor of [Debian cloud images][cloud-img] used to be the most straightforward way to boot a working Debian installation. You cloud simply create a VM using one of these images, boot it, and log in as `root` with no password. Everything would work out of the box. Unfortunately, the [developers decided that we can't have nice things][salsa] and made the process way more complicated than it ever needed to be. If your VM does not display console output before the login prompt, like UTM/QEMU does by default, the boot process appears to hang, leaving you with a non-working system.

There is a way to restore the previous behavior, although slightly more complicated than it used to be:

- Boot the VM and, in the GRUB menu, press `e`.
- Find the line starting with `linux`, append `console=tty0`, and press `CTRL+X`.
- When `systemd-firstboot` greets you, press any key and skip the timezone question by pressing `ENTER` again.
- Set a secure `root` password, like `hunter2`, and confirm it.
- Log in as `root` using the password you just set, then remove it with `passwd -d root`.

After that, you will once again be able to log in as `root` without a password.

[cloud-img]: https://cdimage.debian.org/cdimage/cloud/
[salsa]: https://salsa.debian.org/cloud-team/debian-cloud-images/-/issues/94#note_735348
