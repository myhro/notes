---
title: CLI visualization with Sampler
date: 2024-08-17
---

A colleague saw me using [bottom (`btm`)][bottom] on my laptop and asked if I was using [Sampler][sampler]. I wasn't familiar with the latter, but although the UIs are quite similar, their functionalities are entirely different. While bottom is designed to be a more detailed, zero-configuration replacement for `top` - hence the name - Sampler is intended to be fully customizable.

I'm not fond of the constant forking of subprocesses at short intervals, but it may be useful for certain tasks. I usually default to [Prometheus Blackbox Exporter][blackbox-exporter] for tasks like probing my WAN latency, but this could probably be done in a much simpler way with Sampler.

[blackbox-exporter]: https://github.com/prometheus/blackbox_exporter
[bottom]: https://github.com/ClementTsang/bottom
[sampler]: https://github.com/sqshq/sampler
