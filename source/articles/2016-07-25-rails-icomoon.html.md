---
title: Rails で icomoon で作った icon font を使う
tags: Rails
---

よく icon font が欲しいときに、 [icomoon](https://icomoon.io/) というブラウザから icon font が作れるサービスを使ってます。icomoon で icon font を作ると、icomoon が用意した CDN から自作した icon font を使えるようになるのですが、その CDN は確認用で、本番で使うときはダウンロードしてプロジェクトの中に入れないといけないです。で、久々に Rails で icomoon で作った icon font を使うとしたら色々設定を忘れてたのでメモ。

ちなみに、icomoon ってすごく便利なんだけど、どう使うものなのか全然わかりません（画面に説明が無さ過ぎ！）。初めての方は [リガチャなアイコンフォントをお手軽に作成する](http://blog.ruedap.com/2013/09/17/ligature-icon-fonts) こちらの記事を一読されることをおすすめします。使い方が丁寧に説明してあるので一回読めば使えるようになります。

## icomoon で font を生成

![icomoonでfontを生成 image md](https://i.gyazo.com/d3d3f835a99b1b409d777f3d4bd98164.png)

## font ファイルをダウンロード

![fontファイルをダウンロード image md](https://i.gyazo.com/d08041a6919fb560bd248f910b2b4e02.png)

## ダウンロードしたファイルから font ファイルを移動

その中に icomoon でダウンロードしたファイルを解凍すると、中身がこんな感じになってます。

![ダウンロードしたファイルを解凍すると、中身がこんな感じ](https://i.gyazo.com/baa7420f1f0bd12574e2e4c10ae24bf7.png)

Rails アプリの `vender/assets/` の中に `fonts` ディレクトリを作成し、

![Rails アプリの `vender/assets/` の中に `fonts` ディレクトリを作成](https://i.gyazo.com/03b38a5397a50166f4298a7a6f210829.png)

icomoon でダウンロードしたファイルの中の fonts の中身を移動。

![ダウンロードしたファイルから font ファイルを移動](https://i.gyazo.com/630d41fa88835cbe3259dd300a3eb116.png)

## ダウンロードしたファイルから css ファイルを移動

icomoon でダウンロードしたファイルの中の `style.css` を `vender/assets/stylesheets` の中に移動。

![icomoon でダウンロードしたファイルの中の `style.css` を `vender/assets/stylesheets` の中に移動。](https://i.gyazo.com/2fb6213449287809df7de331fa10a12e.png)

## ダウンロードしたファイルから css ファイルを移動

ファイル名が `style.css` では、何についての css が書いてあるかわかりづらいので、ファイル名を `icomoon.css` に変更しておきます。

`icomoon.css` の `@font-face` の `src` のパス `url('fonts/icomoon...` を `url('assets/icomoon...` に書き換えます。

### 書き換え前

```css
@font-face {
    font-family: 'icomoon';
    src:    url('fonts/icomoon.eot?2d5b77');
    src:    url('fonts/icomoon.eot?2d5b77#iefix') format('embedded-opentype'),
        url('fonts/icomoon.woff2?2d5b77') format('woff2'),
        url('fonts/icomoon.ttf?2d5b77') format('truetype'),
        url('fonts/icomoon.woff?2d5b77') format('woff'),
        url('fonts/icomoon.svg?2d5b77#icomoon') format('svg');
    font-weight: normal;
    font-style: normal;
}
```

### 書き換え後

```css
@font-face {
    font-family: 'icomoon';
    src:    url('assets/icomoon.eot?2d5b77');
    src:    url('assets/icomoon.eot?2d5b77#iefix') format('embedded-opentype'),
        url('assets/icomoon.woff2?2d5b77') format('woff2'),
        url('assets/icomoon.ttf?2d5b77') format('truetype'),
        url('assets/icomoon.woff?2d5b77') format('woff'),
        url('assets/icomoon.svg?2d5b77#icomoon') format('svg');
    font-weight: normal;
    font-style: normal;
}
```

## application から import して完了

最後に、 `application.sass` もしくは `application.scss` 、もしくは `application.css` （ここは人によってファイル名が違います ちなみに僕は `application.sass` 派）から `icomoon.css` を import して作業完了（ファイルの一番最後でOK）。

### application.sass

```sass
@import icomoon
```

application.css の場合は `*= require icomoon.css` を追加。

### application.scss

```scss
@import "icomoon" ;
```

application.css の場合は `*= require icomoon.css` を追加。

### application.css

```css
/*
 *= require_self
 *= require icomoon.css
 *= require_tree .
 */
```

application.css の場合は `*= require icomoon.css` を追加。

<div class="amazlet-box" style="margin-bottom:0px;"><div class="amazlet-image" style="float:left;margin:0px 12px 1px 0px;"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/B0034KM04M/machidateppei-22/ref=nosim/" name="amazletlink" target="_blank"><img src="http://ecx.images-amazon.com/images/I/51e0LFIaHkL._SL160_.jpg" alt="さむくないかい [DVD]" style="border: none;" /></a></div><div class="amazlet-info" style="line-height:120%; margin-bottom: 10px"><div class="amazlet-name" style="margin-bottom:10px;line-height:120%"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/B0034KM04M/machidateppei-22/ref=nosim/" name="amazletlink" target="_blank">さむくないかい [DVD]</a><div class="amazlet-powered-date" style="font-size:80%;margin-top:5px;line-height:120%">posted with <a href="http://www.amazlet.com/" title="amazlet" target="_blank">amazlet</a> at 16.07.25</div></div><div class="amazlet-detail">アップリンク (2010-03-05)<br />売り上げランキング: 135,386<br /></div><div class="amazlet-sub-info" style="float: left;"><div class="amazlet-link" style="margin-top: 5px"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/B0034KM04M/machidateppei-22/ref=nosim/" name="amazletlink" target="_blank">Amazon.co.jpで詳細を見る</a></div></div></div><div class="amazlet-footer" style="clear: left"></div></div>
