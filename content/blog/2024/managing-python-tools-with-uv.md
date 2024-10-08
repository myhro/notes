---
title: Managing Python tools with uv
date: 2024-10-08
---

I've been hearing a lot about [uv][uv] over the past few weeks, but I hadn't actually tried it yet. It seems to perform the same tasks that I'm already familiar with when using `asdf` and `pip`. When I need to run a Python-based tool, like `ipython` or `s3cmd`, I have to:

- Install [asdf][asdf] to manage everything in my home folder (no `sudo` required).
- Install [asdf-python][asdf-python] along with its OS-level libraries to build Python interpreters.
- Install a reasonably up-to-date Python version, such as 3.12.
- Use `pip` to install the desired tool.
- Run the actual command, like `ipython`.

With `uv`, I would:

- Place the `uv`/`uvx` binaries into `~/.local/bin/` (which is already part of my `$PATH`).
- Run the command using the `uvx` helper, like `uvx ipython`.

That's all there is to it. There's no need to manage Python interpreter versions, as `uv` uses whatever is available in the system. I also don't need to use `asdf` and a user-installed `pip` to install packages without `sudo`, as `uv` handles this process by default. It's not even required to install the package before starting it, as `uv` does that in a lightning-fast step.

[asdf-python]: https://github.com/asdf-community/asdf-python
[asdf]: https://github.com/asdf-vm/asdf
[uv]: https://github.com/astral-sh/uv
