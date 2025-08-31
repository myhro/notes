---
title: Podman containers and systemd
date: 2025-08-30
---

Nearly two years ago, I wrote about [how to manage Podman containers using systemd][blog]. What I didn't know back then was that it had already been deprecated, as the project was [moving towards Quadlet][quadlet]. It turns out the experience is now considerably more user-friendly, although with a few gotchas. The equivalent of the example in that blog post is:

    $ cat ~/.config/containers/systemd/valkey.container

```systemd
[Container]
Image=docker.io/valkey/valkey:8
PublishPort=6379:6379

[Quadlet]
DefaultDependencies=false

[Service]
Restart=always

[Install]
WantedBy=default.target
```

It could be made even shorter and more like a regular systemd unit, if it wasn't for the `DefaultDependencies=false` in the `Quadlet` section. This is used to ensure that [the container startup isn't delayed for 90 seconds][timeout] (!). It can be then brought up like any systemd user mode service:

    $ systemctl --user start valkey

[blog]: https://blog.myhro.info/2023/12/managing-podman-containers-with-systemd
[quadlet]: https://www.redhat.com/en/blog/quadlet-podman
[timeout]: https://www.reddit.com/r/podman/comments/1j79hcm/quadlets_start_up_after_90_seconds/
