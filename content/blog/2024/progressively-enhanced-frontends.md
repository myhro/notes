---
title: Progressively-enhanced frontends
date: 2024-08-18
---

The document [Building a resilient frontend using progressive enhancement][prog-enhance] from the [GOV.UK Service Manual][svc-manual] provides valuable insights into creating faster, simpler, and more accessible web pages. It highlights examples such as using a `<select>` element in place of a dynamic autocomplete in case something goes wrong. Additionally, it advises considering multiple scenarios where CSS/JS files fail to load, causing the page to behave as if these functionalities are disabled.

Although the concept is not entirely new - the last update was in 2019 - it's still a helpful reminder that not every web app needs to be a single-page application (SPA). Default to HTML and treat everything else as usability enhancements, not core dependencies for the application's basic functionality.

[prog-enhance]: https://www.gov.uk/service-manual/technology/using-progressive-enhancement
[svc-manual]: https://www.gov.uk/service-manual
