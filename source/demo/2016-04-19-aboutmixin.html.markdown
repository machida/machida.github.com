---
title: Sass初心者のためのmixin講座 1
tags: sass
---

僕の所属してる合同会社フィヨルドっていう会社では、「作業週」と「学習」が交互にやってくるちょっと変わったインターン制度をやってて、まぁ、要するにWebサービスを一人で作れるまでのカリキュラムを用意してて、給料を払わない代わりに勉強ができるというやつです。

## mixinって何？

「詳しく書く」と宣言したので、「mixinって何？」から書いておきたいと思います。

一言でいうと、「Sassで書いたcssの設定をまとめて、それに名前を付けておくと、その名前を呼べぶだけで、まとめたcssの設定が挿入されるやつ」。

はい、全然意味がわからないと思うので、例をあげながら説明したいと思います。

例えば、

```sass
.default-sentence
  font-size: 1rem
  line-height: 1.8
  margin-bottom: 1.4em
  color: black

.important-sentence
  font-size: 1rem
  line-height: 1.8
  margin-bottom: 1.4em
  color: red
  font-weight: bold
```

という、Sassファイルがあったとします。

この場合、 `.default-sentence` 、 `.important-sentence` では、

```sass
  font-size: 1rem
  line-height: 1.8
  margin-bottom: 1.4em
```

この部分が共通してます。この共通している部分に名前を付けて mixin にします。

### mixinのつくり方

mixin の書き方は、

```sass
=[mixinの名前]
  // 以下に共通しているcssプロパティ、値
  font-size: 1rem
  line-height: 1.8
  margin-bottom: 1.4em
```

と、書きます。 `=` (イコール)を使うところがポイントですね。

名前を `paragraph-setting` としました。

```sass
=paragraph-setting
  font-size: 1rem
  line-height: 1.8
  margin-bottom: 1.4em
```

これで、 `paragraph-setting` という名前のmixinの完成です。

ちなみに、scss記法では `=` ではなく、 `@mixin` と書くのですが、sass記法でも `@mixin` と書くこともできます（文字数多くて面倒だから使わないけど）。


```sass
@mixin paragraph-setting
  // 共通部分
  font-size: 1rem
  line-height: 1.8
  margin-bottom: 1.4em
```

### mixinの呼び出し方

続いて、今作ったmixinを使う方の書き方の解説。

```sass
.default-sentence
  // ここに共通分が入る
  color: black

.important-sentence
  // ここに共通分が入る
  color: red
  font-weight: bold
```

`// ここに共通分が入る` ってところで mixin を呼びます。呼び方はこう、

```sass
.default-sentence
  +paragraph-setting
  color: black

.important-sentence
  +paragraph-setting
  color: red
  font-weight: bold
```

`+paragraph-setting` と書いて mixin を呼び出します。 `+[mixinの名前]` と書きます。ポイントは、mixinを作るときは `=` でしたが、呼び出す時は `+` （プラス）になるところですね。

ちなみに、scss記法では `+` ではなく、 `@include` と書くのですが、sass記法でも `@include` と書くこともできます（文字数多くて面倒だから使わないけど）。

```sass
.default-sentence
  @include paragraph-setting
  color: black

.important-sentence
  @include paragraph-setting
  color: red
  font-weight: bold
```

これでmixinの基本はこれだけです。mixinを使えば、何度も同じことを書いてたcssが一行書くだけで済みますね。次回は応用の説明をしたいと思います。
