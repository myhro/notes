---
title: Directory shortcuts with CDPATH
date: 2026-11-08
slug: directory-shortcuts-with-cdpath
---

I'm currently working on multiple Debian packages. All of them are hosted on [their official Git forge][salsa], but within different namespaces and varying levels of nesting, like:

- `debian/entr`
- `go-team/dh-go`
- `go-team/packages/fzf`

I got used to cloning Git repositories locally based on their full URL, a practice I learned from Go packages. This made it harder to `cd` to whatever package I was working on at the moment, especially since `TAB` completion gets worse when paths share the same first characters.

That's when I learned that you can have a `CDPATH` variable in Bash, allowing you to `cd` into any folder in those paths as if it were in the current directory:

```bash
CDPATH=".:$HOME/Documents/salsa.debian.org/debian:$HOME/Documents/salsa.debian.org/go-team:$HOME/Documents/salsa.debian.org/go-team/packages"
```

So instead of having to:

```
$ cd ~/Documents/salsa.debian.org/go-team/packages/fzf/
```

I can just:

```
$ cd fzf/
```

And get to the package folder I wanted.

[salsa]: https://salsa.debian.org/
