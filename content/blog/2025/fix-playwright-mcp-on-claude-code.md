---
title: Fix Playwright MCP on Claude Code
date: 2025-07-05
---

The [Playwright MCP][playwright-mcp] is particularly interesting for an agent like [Claude Code][claude-code], as it is significantly more flexible than using the Playwright library via JavaScript for browser interactions. The issue is that it defaults to Google Chrome, which isn't available on platforms like Linux/arm64 (e.g. a Linux VM running on Apple Silicon):

```
Error: browserType.launchPersistentContext: Chromium distribution 'chrome' is not found at /opt/google/chrome/chrome
Run "npx playwright install chrome"
(...)
ERROR: not supported on Linux Arm64
Failed to install browsers
Error: Failed to install chrome
```

The fix is simple. You can either ask Claude Code itself to modify its `~/.claude.json` file or edit it directly, switching to Chromium by appending the `--browser chromium` argument to the `mcpServers` setting, like:

```json
"mcpServers": {
  "playwright": {
    "type": "stdio",
    "command": "npx",
    "args": [
      "@playwright/mcp@latest",
      "--browser",
      "chromium"
    ],
    "env": {}
  }
},
```

[claude-code]: https://www.anthropic.com/claude-code
[playwright-mcp]: https://github.com/microsoft/playwright-mcp
