---
title: Usefulness of small JavaScript snippets
date: 2024-10-15
---

Being a [Greasemonkey][greasemonkey] user nearly 20 years ago, I got used to the idea of having small JavaScript snippets that change the behavior of web pages. At the same time, the attack surface is just too wide for an extension that can literally execute code on every site you visit. For this reason, I stopped using it and [similar extensions][tampermonkey], opting instead for vetted, scope-limited snippets. I just open the browser console and paste them.

Want to allow paste on a page that disables it for whatever reason and prevents, for instance, passwords from being pasted?

```js
var allowPaste = function(e) {
  e.stopImmediatePropagation();
  return true;
};
document.addEventListener('paste', allowPaste, true);
```

(This one I got from StackOverflow).

Want to play the audio of every response of a [Dota 2 hero in their wiki][zeus-responses]?

```js
const audios = $('li span audio');

function playAudio(index) {
  if (index === audios.length) return;

  const audio = audios.eq(index)[0];

  audio.addEventListener('loadeddata', () => {
    audio.play();
  });

  audio.addEventListener('ended', () => {
    setTimeout(() => playAudio(index + 1), 1000);
  });

  audio.load();
}

playAudio(0);
```

(This one was written by a former [colleague who is really good with JavaScript][edmundo]. I asked ChatGPT to update it after [the Dota Wiki moved][dota-wiki-move]).

Yesterday, I started using another one to prevent web pages from updating their titles. This prevents, for instance, the WhatsApp web app from capturing my attention every time a new message arrives by changing the counter in the page title:

```js
Object.defineProperty(document, 'title', {
  set: function(newTitle) {
    // Do nothing, preventing title changes
  },
  get: function() {
    return document.querySelector('title').textContent;
  }
});
```

Their usefulness is endless. Still, the most important use case for me is to reduce annoyances on random websites.

[dota-wiki-move]: https://www.reddit.com/r/DotA2/comments/1c4kg1n/official_announcement_dota_2_wiki_has_moved_to_a/
[edmundo]: https://github.com/rdsedmundo
[greasemonkey]: https://www.greasespot.net/
[tampermonkey]: https://www.tampermonkey.net/
[zeus-responses]: https://liquipedia.net/dota2/Zeus/Responses
