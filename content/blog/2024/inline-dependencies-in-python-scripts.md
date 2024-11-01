---
title: Inline dependencies in Python scripts
date: 2024-10-31
---

I once worked for a company that distributed internal CLI tools written in Python. Imagine various wrappers for `aws`, `kubectl`, etc. that implemented company-wide authentication and a few other features. The idea was promising, using small wrappers written in a simple scripting language, but the execution was far from ideal. There were too many combinations of operating systems and Python versions to support, not to mention the requirement to install all dependencies.

Little did they know that many years later, it would become possible to [embed both dependencies and the Python interpreter version itself][inline-metadata] directly within script files:

```python
# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "requests",
# ]
# ///

import json
import sys
import requests

data = {"python_version": sys.version}
response = requests.post("https://httpbin.org/post", json=data)
print(json.dumps(response.json(), indent=4))
```

And then [run it with `uv`][uv]:

```
$ uv run main.py
Reading inline script metadata from: main.py
{
    "args": {},
    "data": "{\"python_version\": \"3.12.6 (main, Sep  6 2024, 19:03:47) [Clang 16.0.0 (clang-1600.0.26.3)]\"}",
(...)
```

[uv]: /2024/10/managing-python-tools-with-uv/
[inline-metadata]: https://packaging.python.org/en/latest/specifications/inline-script-metadata/
