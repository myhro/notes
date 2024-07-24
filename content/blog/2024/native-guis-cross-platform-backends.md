+++
title = "Native GUIs, cross-platform backends"
date = "2024-07-24"
+++

A while ago I saw an article that mentions how a macOS application had its GUI written in Cocoa/Swift, but the backend was a [Racket][racket] JSON-RPC server:
https://defn.io/2020/01/04/remember-internals/

This contrasts with what I did in the past, writing a Windows desktop application without splitting the GUI from the backend, completely in C#. Another nice aspect of this approach is that the backend can be reused between different OSes, as only the GUI is tightly coupled to the platform.

[racket]: https://en.wikipedia.org/wiki/Racket_(programming_language)
