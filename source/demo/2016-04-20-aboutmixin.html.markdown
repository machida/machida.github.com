---
title: Sass初心者のためのmixin講座 2
tags: sass
published: false
---


## mixinに引数を渡す

前回作った mixin は、

```sass
=paragraph-setting
  font-size: 1rem
  line-height: 1.8
  margin-bottom: 1.4em
```

ですね。

で、使う方のsassは、

```sass
.default-sentence
  +paragraph-setting
  color: black

.important-sentence
  +paragraph-setting
  color: red
  font-weight: bold
```
