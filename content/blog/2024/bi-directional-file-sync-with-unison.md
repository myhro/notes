---
title: Bi-directional file sync with Unison
date: 2024-09-08
---

I heard about [Unison][unison] a long time ago, but never tried it for real. Two-way file synchronization just sounds too fragile, almost too good to be true. Still, for some specific use cases, it might make sense. I wanted to sync source code from remote machines to my laptop in a way that allows me to edit the files locally without worrying about downloading and uploading them manually each time. Given that the files will only change on one side at a time, it seemed like a reasonable way to try out Unison. There's a greater chance it will work when concurrent writes are not involved.

Getting the `unison` package is just one `apt` or `brew` install away, but, to my surprise, it doesn't support watching directories by default. Whenever it is started with `-repeat watch` (or `repeat = watch` in the config file), it stops with:

    Error: No file monitoring helper program found

It requires the `unison-fsmonitor` command, which isn't included in the Debian package (there has been an [open bug since 2016][debian-bug]), and it doesn't support macOS at all. To work around this, on Debian, it can be compiled from source (it only requires the `ocaml` package in addition to `build-essential`), and on macOS, there's an unofficial [Rust-based implementation][fsmonitor]. Be sure to install it on both nodes, otherwise it will stop with a similar error:

    Error: Server: No file monitoring helper program found

[debian-bug]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=819341
[fsmonitor]: https://github.com/autozimu/unison-fsmonitor
[unison]: https://github.com/bcpierce00/unison
