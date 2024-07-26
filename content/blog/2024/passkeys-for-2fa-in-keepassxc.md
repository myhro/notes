---
title: Passkeys for 2FA in KeePassXC
date: '2024-07-26T01:00:00'
---

A few years ago, GitHub supported using a [MacBook's Touch ID as a security key][touch-id] for Two-Factor Authentication (2FA). This feature wasn't very intuitive or user-friendly, given that even when using the same machine, the Touch ID security key would change after macOS reinstalls. However, it was still more convenient than a mobile app and more secure than SMS-based codes.

These days, passkeys (similar to [hardware security keys][yubico] but implemented in software) can be used for both passwordless logins and as a security key for 2FA. On Chrome, if using the native macOS option, it's necessary to tie them to the system's iCloud account, which I prefer not to do. A way to work around that is to [manage passkeys using KeePassXC][keepassxc], asserting control of the credentials without tying them to a cloud service.

[keepassxc]: https://keepassxc.org/docs/KeePassXC_UserGuide#_passkeys
[touch-id]: https://www.stevemar.net/touch-id-as-a-security-key/
[yubico]: https://www.yubico.com/
