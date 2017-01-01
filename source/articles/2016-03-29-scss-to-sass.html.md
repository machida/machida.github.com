---
title: ブラウザ上で「scss 記法」を「sass 記法」に変換する方法
tags: sass
---

普段、僕は sass 記法を使っています。「sass 記法 vs. scss 記法」の話は「Vim vs. Emacs」みたいなややこしいことになりそうなので、ここであまり多くを書かないですが、僕は sass 記法派というより、なんで scss 記法があるのかわからない派、ってくらい圧倒的 sass 記法派。だって、sass 記法の方が短く書けるし、見やすいし、誰が書いてもスペースやインデントは同じになるし...。デメリットは、ネット上にある Sass の tips なんかの例のほとんどが scss 記法で書かれてるので、それを毎回脳内で sass 記法に変換しなくてはいけない、という手間があるくらい？

さてさて、「sass 記法 vs. scss 記法」の話はどうでもいいんだけど、普段 sass 記法を使ってるので、 `.scss` を `.sass` に変換したくなるときがたまにあります。例えば、scss 記法で書かれたCSSフレームワークのコードを読むときに、sass記法の方が慣れてるから読みやすいので変換したりなど。

Sassが使える環境でコマンドラインを使って、

```shell
$ sass-convert {変換したいファイル "例:test.scss"} {変換して生成するファイル名 "例:test.sass"}
```

とやれば、 `.scss` を `.sass` に変換することができるんだけど、ブラウザで見てる GitHub 上のコードなんかをいちいちローカルに持ってきて変換するのは面倒。

ブラウザからそれを出来るWebサービスはないかなぁ、と探していたところ、ブラウザ上でSassをCSSに変換できるサービス、[SassMeister](http://www.sassmeister.com/) で出来ました。 SassMeister を使って `.scss` を `.sass` に変換するってのはイレギュラーな使い方なのですが、便利なのでその手順を紹介。

## 手順 1

Options > Syntax > **SCSS** を選択。

![Options > Syntax > **SCSS** を選択。 image md](https://i.gyazo.com/138287950f16d23cd3fd834b1c7f5e8e.png)


## 手順 2

左側に変換したい `.scss` のコードをコピペ。

![左側に変換したい `.scss` のコードをコピペ。 image md](https://i.gyazo.com/4af7d805104f6ca553aa7baca0dfb93c.png)


## 手順 3

Options > Syntax > **SASS** に変更する。

![Options > Syntax > **SASS** に変更する。 image md](https://i.gyazo.com/2a3e20d5500390e7109c002399523951.png)


## 変換完了！

sass記法に変換されました。
逆に `.sass` から `.sass` に変換もできます。

![sass記法に変換されました。 image md](https://i.gyazo.com/056821fec2e2d238e84c968c9b8ffac7.png)


<div class="amazlet-box" style="margin-bottom:0px;"><div class="amazlet-image" style="float:left;margin:0px 12px 1px 0px;"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4584181519/machidateppei-22/ref=nosim/" name="amazletlink" target="_blank"><img src="http://ecx.images-amazon.com/images/I/51ep0rd8R9L._SL160_.jpg" alt="因果鉄道の旅―根本敬の人間紀行 (ワニの本)" style="border: none;" /></a></div><div class="amazlet-info" style="line-height:120%; margin-bottom: 10px"><div class="amazlet-name" style="margin-bottom:10px;line-height:120%"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4584181519/machidateppei-22/ref=nosim/" name="amazletlink" target="_blank">因果鉄道の旅―根本敬の人間紀行 (ワニの本)</a><div class="amazlet-powered-date" style="font-size:80%;margin-top:5px;line-height:120%">posted with <a href="http://www.amazlet.com/" title="amazlet" target="_blank">amazlet</a> at 16.07.15</div></div><div class="amazlet-detail">根本 敬 <br />ベストセラーズ <br />売り上げランキング: 102,374<br /></div><div class="amazlet-sub-info" style="float: left;"><div class="amazlet-link" style="margin-top: 5px"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4584181519/machidateppei-22/ref=nosim/" name="amazletlink" target="_blank">Amazon.co.jpで詳細を見る</a></div></div></div><div class="amazlet-footer" style="clear: left"></div></div>
