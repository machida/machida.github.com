---
title: GitHub Issues を使って見た目に関する報告する方法
tags: GitHub
---

普段、仕事では HTML や CSS をいじることが多いので、Sass のフレームワークを一新したりなど、全体に影響する大きい変更があった場合は、社内のインターンの方にデザイン崩れがないかを目視で確認をお願いすることがたまにあります。

そういうとき、デザイン崩れを見つけたら、 Github Issues に登録してもらってるのですが、こういうデザイン崩れなど「見た目」についての報告をしてもらう際に、文章だけで報告されるとつらい。報告をされたほうは「どこのことを言ってるんだろう？」ってなります。

なので毎回、

> - 該当箇所の画像（必要であれば、画像の中の該当箇所に矢印などのマークを入れる）
> - それが起きているページのURL
> - 必要であれば文章も（例えば、ログインしていて投稿が0の場合、などそれが起こる条件など）

をセットで報告してね、と言ってるのですが、毎回言うのも面倒なので、言う代わりにペッとURLを貼り付けるだけで済まそうと思って、こちらのブログに書くことにしました。

## ダメな報告の例

![ダメな報告の例](https://i.gyazo.com/47d564e70b1e4a90980c813ec9f090fd.png)

これだとどこのページのことを言ってるのか、どのアイコンのことを言ってるのか全然わからないですね。「これってどこのこと？それが起きてる画面を見せて教えてー」なんてやりとりをしてたら報告する側も、報告される側もお互いに無駄に時間がかかってしまいます。それに「なんか変です。」って、そんな文章を付けるんだったら書いてないのと同じ、いや、むしろ読んでも何の足しにもならない文章を書いた、読んだ時間だけ無駄です :anger:。

大体の Web アプリは「一覧ページ」、「個別ページ」があります。例えば、[怖話](http://kowabana.jp/)でいったら、怖い話の一覧ページと怖い話の個別ページがあります。「怖い話の」より、「怖い話の一覧ページの」、「怖い話の個別ページの」まで書いてくれるとわかりやすいです。

## いい報告の例

![いい報告の例](https://i.gyazo.com/aa9cd0c8a69eb6101549097d930c4072.png)

ここまで丁寧に書いてくれると報告されたほうも助かります。

## GitHub Issues に画像を貼る方法（Mac のみ）

「毎回画像貼るの！？ 面倒くせーからインターンやめるわ」って思ったかたもいるかもしれないですが、Github Issues に画像を貼るのってすごく簡単だから大丈夫。

### command + shif + 4 キーを同時に押す

ちょっと押しにくいですが、 `command` + `shif` + `4` キーを同時に押します。すると、マウスカーソルが「+」に変わります。

![GitHub Issues に画像を貼る方法（Mac のみ） image md](https://i.gyazo.com/52a5b775aa3ddb0baa237137b89affc1.png)

### キャプチャを撮りたい部分を選択

マウスカーソルが「+」に変わったのを確認してから、画像として貼りたい箇所でマウスやトラックボードのボタンを押し、押した状態をキープしたままカーソルを引っ張って囲います。ボタンから指を離すと「パシャ」っとカメラのシャッター音が鳴ります。すると、クリップボード（一時的にデータを保存できる共有のメモリ領域）に選択したキャプチャが画像として保存されます。

![キャプチャを撮りたい部分を選択 image md](https://i.gyazo.com/9aa77ac9ddb070a28ea17a84d46ad795.jpg)

### GitHub Issues にキャプチャを貼り付け

クリップボードにキャプチャが保存された状態で、GitHub Issues の本文を入力するテキストエリアにペースト（ `command` + `v` キーを同時に押す）すると、 `![Uploading image.png...]()` という文字が出ます。「今、画像をアップロードしてるところだよ」と言ってますね。

![GitHub Issues にキャプチャを貼り付け image md](https://i.gyazo.com/897f0cf95b081da2f50db0d5268be399.png)

少し待つと画像がアップロードが完了して、`![image](https://cloud.githubusercontent.com/assets/xxx/xxx.png)` と、markdown記法での画像表示のマークアップに変わります。

![GitHub Issues にキャプチャを貼り付け完了 image md](https://i.gyazo.com/c84123488b0d3c69d0c606f0ef3c58fa.png)

これで GitHub Issues に画像を貼れました。

## 矢印や文字を入れた画像を GitHub Issues に貼る方法

先ほどのはキャプチャを貼るだけでしたが、場合によっては、キャプチャ内のこの部分を示したいときもあります。そういった場合は矢印や文字を入れたキャプチャを GitHub Issues に貼るとわかりやすくなります。

### Skitch をインストール

まずは、Skitch というツールをインストール。

![Skitch というツールをインストール image md](https://i.gyazo.com/e389197a185a9d18afe0992515837826.png)

[https://evernote.com/intl/jp/skitch/](https://evernote.com/intl/jp/skitch/)

### Skitch を立ち上げて Evernote アカウントでログイン

Skitch を立ち上げると、Skitch は [Evernote](https://evernote.com/intl/jp/) のサービスなので Evernote アカウントでログインを求められます。もし Evernote アカウントを持っていなかったら「Evernote 新規ユーザ」から登録をします。Evernote アカウントを持っていたら、「既にアカウントを持っている場合」からそのアカウントでログインをします。ちなみに、Evernote の無料会員で Skitch は使えるのでお金はかかりません（2016年7月9日現在）。

![Skitch を立ち上げて image md](https://i.gyazo.com/a5f6912771efc91ad5d9a8a62674756f.jpg)

ログインをすると、Skitch がこのような画面になります。

![Skitch ログイン完了 image md](https://i.gyazo.com/0b530ae7c7a245a055241b90449ac65e.jpg)

### Skitch でキャプチャを撮る

ログイン後、Skitch の画面の上部にある「画面キャプチャ」ボタンをクリック。

![Skitch 画面キャプチャ image md](https://i.gyazo.com/7ac9566925619e77a562a2bacab20e7f.png)

すると、画面にオーバーレイがかかって、カーソルが「+」になります。

![Skitch 画面キャプチャを撮る image md](https://i.gyazo.com/762ab4c86a165312ac1e6166da3a3a2d.jpg)

先ほどの  `command` + `shif` + `4`  ときと同じように画像として貼りたい箇所でマウスやトラックボードのボタンを押し、押した状態をキープしたままカーソルを引っ張って囲い、ボタンを離します。

すると、選択した部分のキャプチャが Skitch の画面に表示されます。

![Skitch 画面キャプチャを撮った image md](https://i.gyazo.com/77c251795a6485b96874216eb49847e2.jpg)

Skitch の画面の左にあるツールを使ってキャプチャに矢印や文字を書き込みます。

![Skitch 画面キャプチャに書き込みをした  image md](https://i.gyazo.com/2f5e0dfdc2801142b1549785e9fe63e5.jpg)

書き込みが完了したらいよいよ Github Issues に貼り付けます。まずは、Skitch の画面の下にある「PNG」と書いてあるファイルの絵のアイコンの上でマウス、トラックパッドのボタンを押します。すると、Skitch の画面の枠がなくなり、キャプチャの部分が小さくなります。

![Skitch pngアイコンをクリック image md](https://i.gyazo.com/1493f6d64ad01203603b116b00a0bb12.jpg)

マウスやトラックボードのボタンを押した状態をキープしたままキャプチャ画像を GitHub Issues のテキストエリアまで持ってきて、ボタンから指を離すと、画像のアップロードが始まります。

![GitHub Issues の textare で離す image md](https://i.gyazo.com/e1dd0506746301e993b843b118ba2647.png)

Skitch からアップロードをすると、markdown ではなく、HTML タグが書き出されますが、問題なく画像が貼り付けられます。

![png でアップロードされた image md](https://i.gyazo.com/43d45da5697d30e1d4a91939623d74dc.png)

これで、矢印や文字を入れた画像を GitHub Issues に貼れるようになりました。

## 動画を GitHub Issues に貼る方法

サイト内の動く部分を人に伝えるときは動画を使うと便利。
例えば、JavaScriptを使って動くところの動きの不具合や、クリックなどアクションをした後に起きる不具合などは、それを再現させる動作を動画で伝えたほうがわかりやすいです。

### キャプチャ動画を撮るツールのインストール

まずは、Gyazo というツールをインストールします。

[https://gyazo.com/ja](https://gyazo.com/ja)

「今すぐGyazoをはじめる」をクリック。

![「今すぐGyazoをはじめる」をクリック。 image md](https://i.gyazo.com/87482b9e0c59ad80db7921adaabfc2c6.jpg)


「簡易版」の「ダウンロード」をクリック。

![「簡易版」の「ダウンロード」をクリック。 image md](https://i.gyazo.com/de4839ff72d9b4884b9eea10dda6e034.jpg)

すると、ファイルがダウンロードが始まり、「Gyazo」と「Gyazo GIF」という2つのアプリのインストール方法が表示されます。そのインストール方法に従って、「Gyazo」と「Gyazo GIF」をインストールします。

![Gyazo と Gyazo GIF をインストールします。](https://i.gyazo.com/4ea14f4b5b72ee11715f7bb576e31491.png)

これで、キャプチャ動画を撮る準備ができました。

### キャプチャ動画を撮ってみる

先ほどインストールした「Gyazo」と「Gyazo GIF」のうちの「Gyazo GIF」のほうを立ちあげます。すると、画面にオーバーレイがかかって、カーソルが「+」になります。

キャプチャ動画を撮りたい箇所でマウスやトラックボードのボタンを押し、押した状態をキープしたままカーソルを引っ張って囲い、ボタンを離します。

![キャプチャ動画を撮りたい箇所 image md](https://i.gyazo.com/3a79bf0e51ff2fefb50457815af7dd9c.jpg)

ボタンを話すと録画が始まりますので、画面を操作して動かします。ちゃんとマウスのカーソルも録画されます。最長7秒間録画することができます。録画が始まると3つのボタンと横棒が表示されるので、それらの操作方法も載せておきます。

![Gyazo GIFの操作方法 image md](https://i.gyazo.com/18de8ab2dccd57b01238cdc7d34620ba.png)

録画が完了して、キャプチャ動画が Gyazo のサーバにアップロードされると、

![Gyazo GIF アップロード完了 image md](https://i.gyazo.com/89c942e7eca5736f176a8c4836a02a00.jpg)

こういうページがブラウザで表示されます。ちゃんと動画が撮れました。

### キャプチャ動画を GitHub Issues に貼り付ける

このページのキャプチャ動画の上で右クリックをし、「名前を付けて画像を保存」を選択します（ブラウザはChrome）。一旦画像をMacに保存します。

![右クリック image md](https://i.gyazo.com/0aeb24b032c5c8ee24605931e508b8a1.png)

保存をしたら、GitHub Issues のテキストエリアにドラッグ&ドロップ（画像ファイルの上でマウスやトラックボードのボタンを押し、押した状態をキープしたまま GitHub Issues のテキストエリアの上に持って行って指を離す）。

![GitHub Issues のテキストエリアにドラッグ&ドロップ image md](https://i.gyazo.com/40417c91ce5776d48614c5dc52859ecd.png)

画像のアップロードが始まって、しばらく待つとアップロードが完了します。動画はGIFアニメなので、拡張子が `.gif` ならOK。

![Upload中 image md](https://i.gyazo.com/1d337b00ba15b9e1538b92b64466f683.png)

アップロードが完了したら GitHub Issues のテキストエリアの上にある、「Write」、「Preview」のタブの「Preview」をクリックしてプレビューを見てみます。

![タブを切り替え image md](https://i.gyazo.com/e618351c72b631d62a7ffd0c71dd5663.png)

動画によっては表示されるのに時間がかかるときがありますが、少し待ってちゃんと動画が貼り付けられてるのが確認できたら動画貼り付け完了。

![プレビューの確認 image md](https://i.gyazo.com/a0921341824ce3b5f4a8f4685cfda91a.gif)

<div class="amazlet-box" style="margin-bottom:0px;"><div class="amazlet-image" style="float:left;margin:0px 12px 1px 0px;"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4309908160/machidateppei-22/ref=nosim/" name="amazletlink" target="_blank"><img src="http://ecx.images-amazon.com/images/I/61bfOLZv0ZL._SL160_.jpg" alt="特殊まんが-前衛の-道" style="border: none;" /></a></div><div class="amazlet-info" style="line-height:120%; margin-bottom: 10px"><div class="amazlet-name" style="margin-bottom:10px;line-height:120%"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4309908160/machidateppei-22/ref=nosim/" name="amazletlink" target="_blank">特殊まんが-前衛の-道</a><div class="amazlet-powered-date" style="font-size:80%;margin-top:5px;line-height:120%">posted with <a href="http://www.amazlet.com/" title="amazlet" target="_blank">amazlet</a> at 16.07.15</div></div><div class="amazlet-detail">根本 敬 <br />東京キララ社 <br />売り上げランキング: 507,282<br /></div><div class="amazlet-sub-info" style="float: left;"><div class="amazlet-link" style="margin-top: 5px"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4309908160/machidateppei-22/ref=nosim/" name="amazletlink" target="_blank">Amazon.co.jpで詳細を見る</a></div></div></div><div class="amazlet-footer" style="clear: left"></div></div>
