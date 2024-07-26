---
title: Diagrams as code with Mermaid
date: 2024-07-25
---

I recently saw an article mentioning how Gantt chart diagrams are useful to represent distributed traces in [Mermaid][mermaid], the JavaScript library used to build graphs from Markdown: https://brycemecum.com/2023/03/31/til-mermaid-tracing/

Mermaid isn't valuable just for Gantt charts, but for any diagram that would benefit from being built from code. In a previous company, we had an issue where it was virtually impossible to edit diagrams attached to project documentation, given that multiple people used different tools for that and just attached the exported images. Our lives literally changed when we realized Notion had built-in support for Mermaid.

[mermaid]: https://mermaid.js.org/
