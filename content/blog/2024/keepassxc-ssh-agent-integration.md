---
title: KeePassXC SSH agent integration
date: 2024-09-04
---

When I first heard that some password managers supported SSH agent integration, I didn't see much benefit. After all, the SSH key passphrases were already stored there. It was just a matter of running `ssh-add` to add them. I soon forgot about it and didn't pursue the matter further.

Earlier today, I read about how SSH keys can be stored in the [Mac's Secure Enclave][secure-enclave], tying them to the device and preventing their extraction (at least [until an attack is discovered][yubikey-vuln]). I don't like the idea of losing the keys to the kingdom and facing a major hassle when switching laptops, so I looked for alternatives. That's when I remembered that [KeePassXC supports SSH agent integration][keepassxc-ssh-agent].

I've always liked KeePassXC's documentation, even before [learning how to use its passkey support][keepassxc-passkey]. That's when it clicked: the goal isn't just to avoid storing keys in `~/.ssh/` (which is already a major benefit, given how easily the files can be copied). It's about the entire key management lifecycle: storing them securely, adding them to the agent when unlocking the secret store, and removing them when locking it, if needed. It's all there. There's really no reason to manually run `ssh-add` anymore.

[keepassxc-passkey]: /2024/07/passkeys-for-2fa-in-keepassxc/
[keepassxc-ssh-agent]: https://keepassxc.org/docs/KeePassXC_UserGuide#_configuring_an_entry_to_use_ssh_agent
[secure-enclave]: https://support.apple.com/guide/security/secure-enclave-sec59b0b31ff/web
[yubikey-vuln]: https://arstechnica.com/security/2024/09/yubikeys-are-vulnerable-to-cloning-attacks-thanks-to-newly-discovered-side-channel/
