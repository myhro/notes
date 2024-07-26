---
title: Systemd can also be a firewall
date: 2024-07-18
---

This is something I didn't know about, but apparently, systemd can act as a firewall for services configured with `IPAddressDeny` or `IPAddressAllow` settings. It's important to keep this in mind when debugging strange networking issues where it's not obvious what might be dropping packets: https://rachelbythebay.com/w/2024/07/17/bpf/

The funny thing is that this reminds me a lot of [BPFirewall][bpfirewall], a minimalist Linux kernel firewall based on BPF, which I wrote for my [BPF 101 - Getting Linux superpowers][bpf-101] presentation a few months ago.

[bpf-101]: https://talks.myhro.info/2024/2024-02-bpf-101.slide
[bpfirewall]: https://github.com/myhro/bpfirewall
