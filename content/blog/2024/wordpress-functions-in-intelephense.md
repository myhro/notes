---
title: WordPress functions in Intelephense
date: 2024-12-04
---

The [Intelephense language server extension][ext] is quite interesting. It doesn't even require PHP to be installed for it to work, and it provides IDE-like features such as "Find All References", "Go to Definition", and more. One annoying issue is that while it identifies some WordPress functions and properly displays their inline documentation, it fails to do so for others. Fortunately, there's an easy fix for this.

In VS Code, the process is as follows:

- Open the `PHP Intelephense` extension settings.
- Search for `stubs`.
- Click on `Add Item` and select `wordpress`.

[ext]: https://marketplace.visualstudio.com/items?itemName=bmewburn.vscode-intelephense-client
