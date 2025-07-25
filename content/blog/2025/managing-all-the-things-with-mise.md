---
title: Managing all the things with mise
date: 2025-07-24
---

I liked the idea of version managers from the first time I came into contact with [rbenv][rbenv]. Back then, I was migrating my blog to Jekyll in order to serve it via GitHub Pages and needed to use a specific version of Ruby. A while later, I learned about [asdf][asdf] and how I could use it for multiple languages instead of downloading a separate version manager for each one of them. Under the hood, it still relies on tools like `rbenv`, but the process is transparent, and that's what matters from a UX perspective.

Considering how much version managers have made my life easier, I took it a step further and developed my own, called [staticd][staticd]. Instead of downloading programming language interpreters and runtimes, it downloads statically linked binaries straight from GitHub, the kind that don't depend on OS-level libraries to run. And for almost four years, it served me well.

That was until I learned about [mise][mise]. It does exactly what `staticd` does, but with a [much larger registry][mise-registry]. On top of that, it also manages programming language runtimes in the same way that `asdf` does. Consequently, just as I once replaced `rbenv`/`pyenv` with `asdf`, I replaced `asdf`/`staticd` with `mise`. Maybe technology really does go in circles.

[asdf]: https://github.com/asdf-vm/asdf
[mise-registry]: https://mise.jdx.dev/registry.html#tools
[mise]: https://github.com/jdx/mise
[rbenv]: https://github.com/rbenv/rbenv
[staticd]: https://github.com/myhro/staticd
