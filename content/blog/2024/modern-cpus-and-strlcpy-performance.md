---
title: Modern CPUs and strlcpy() performance
date: 2024-07-26
---

A really interesting write-up about how `strlcpy()` performs on modern CPUs. It reminds me a bit of the ACM Queue article [C Is Not a Low-level Language][c-pdp-11], showing why our expectations of optimization might not hold up in the real world: https://nrk.neocities.org/articles/cpu-vs-common-sense

Things like branch prediction, instruction-level parallelism (ILP) and SIMD (Single Instruction, Multiple Data) CPU optimization techniques are real and affect performance more than we might expect. Real-world benchmarking is still an invaluable tool to confirm or disprove theoretical performance optimizations.

[c-pdp-11]: https://queue.acm.org/detail.cfm?id=3212479
