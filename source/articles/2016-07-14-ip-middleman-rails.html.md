---
title: プライベート IP アドレスでローカルで立ち上げてる Rails、middleman にアクセスする方法
tags: middleman, Rails
---

ローカルで立ち上げてる、開発中の Rails や middleman を使って作ってるアプリをスマホやタブレットの実機を使って動作確認をしたくなるときがあります。

そんなときは、プライベート IP アドレスを調べて、 `http://192.168.xx.xx:4567`（192.168.xx.xx がプライベート IP アドレス） にアクセスすると、 で同じ LAN 内のスマホやタブレットや Windows機、VirtualBox や VMware や Parallels Desktop で入れてる Mac の中の Windows からもアクセスできます。今回はプライベート IP アドレスを調べ方をメモ。

## Rails の場合

普段は、

```bash
$ rails server
```

で、Rails を立ち上げてますが、プライベート IP アドレスでアクセスする場合は、

```bash
$ rails server --binding=0.0.0.0
```

と、`--binding=0.0.0.0` というオプションを付けます。

## プライベート IP アドレスを調べる方法

ターミナルに `ifconfig` と打つと、

```bash
$ ifconfig
```

ドバーっと文字が出てきます。その中から「192.168.xx.xx」という数字を探します。MacBookPro 、MacBookAir を使っていて wifi でネットにつないでる場合は `en0:` のブロックにその数字があります（機種によって異なります）。

![IPを調べる](https://i.gyazo.com/c680e710cdd9ce166c8f97c666935c75.png)

`http://192.168.xx.xx:4567` にブラウザからアクセスすると、Google Photo の画像が表示されてるはず。

ちなみに、先ほども書きましたが、MacBookPro 、MacBookAir を使っていて wifi でネットにつないでる場合は `en0:` のブロックにその数字があるので、

```bash
$ ipconfig getifaddr en0
```

と、ターミナルに打つと、

```bash
192.168.xx.xx
```

こんな風にプライベート IPアドレスが表示されます。

## システム環境設定から IP アドレスを調べる方法

プライベート IP アドレスを調べるもう一つの方法として、ターミナルを使わないで Mac のシステム環境設定から調べる方法があります。

### システム環境設定

システム環境設定を開いて、「ネットワーク」を選択。

![システム環境設定 image md](https://i.gyazo.com/5358c6a48489752fc32d663f693e4bf7.png)


### ネットワーク

「ネットワーク」の画面の中の、今ネットをつないでいる接続方法のところを見ると（キャプチャでは wifi）、そこにプライベート IP アドレスが表示されています。

![ネットワーク IP](https://i.gyazo.com/a9dfefad90a44de194497c40027ddc31.png)


<div class="amazlet-box" style="margin-bottom:0px;"><div class="amazlet-image" style="float:left;margin:0px 12px 1px 0px;"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4872333055/machidateppei-22/ref=nosim/" name="amazletlink" target="_blank"><img src="http://ecx.images-amazon.com/images/I/51l92yOfebL._SL160_.jpg" alt="電波系" style="border: none;" /></a></div><div class="amazlet-info" style="line-height:120%; margin-bottom: 10px"><div class="amazlet-name" style="margin-bottom:10px;line-height:120%"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4872333055/machidateppei-22/ref=nosim/" name="amazletlink" target="_blank">電波系</a><div class="amazlet-powered-date" style="font-size:80%;margin-top:5px;line-height:120%">posted with <a href="http://www.amazlet.com/" title="amazlet" target="_blank">amazlet</a> at 16.07.15</div></div><div class="amazlet-detail">根本 敬 村崎 百郎 <br />太田出版 <br />売り上げランキング: 132,434<br /></div><div class="amazlet-sub-info" style="float: left;"><div class="amazlet-link" style="margin-top: 5px"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4872333055/machidateppei-22/ref=nosim/" name="amazletlink" target="_blank">Amazon.co.jpで詳細を見る</a></div></div></div><div class="amazlet-footer" style="clear: left"></div></div>
