---
title: Rails で静的ページを作る簡単な方法
tags: Rails
---

例えば、「利用規約」や「プライバシーポリシー」、ヘルプページなど、毎回サービスをリリースするときに必要になる静的ページがありますが、そういうページを作るときに、Rails の `controller` や `routes` をいじるのが面倒。

Middleman はファイルを置けば静的ページが作られるってところが便利で、Rails でもそういう機能が欲しいって思うときがあります。

その機能を実現するのが [thoughtbot](https://thoughtbot.com/) が作った「[high_voltage](https://github.com/thoughtbot/high_voltage)」っていう Gem。thoughtbot は他にも bourbon や paperclip 、factory_girl など、デザイナでもよく聞く有名な Gem を作ってる会社。


## high_voltage のインストール

まずは Rails アプリの `Gemfile` に、

```
gem 'high_voltage'
```

を追加して、

```
$ bundle
```

コマンドを打ちます。

これで high_voltage が使えるようになりました。

## 注意

`pages` という `controller` をすでに使ってる場合、high_voltage は使えないです。

## ページの作成

`app/views` のディレクトリの中に `pages` というディレクトリを作ります。

コマンドラインで作る場合はこう。

```
$ mkdir app/views/pages
```

で、試しに `about` ってページを作ってみましょう。

`app/views/pages/` のディレクトリの中に `about.html.erb`（もしくは、`about.html.haml`、`about.html.slim` など）を作ります。

コマンドラインで作る場合はこう。

```
$ touch app/views/pages/about.html.erb
```

適当に `about.html.erb` （もしくは、`about.html.haml`、`about.html.slim` など）に何か書いておきます。

![about.html.erb](https://i.gyazo.com/580314db20f377cbc18dab747a9ff4e0.png)

## 作成したページの確認

Rails を立ちあげて、

```
$ rails s
```

作成したページにアクセス（[http://localhost:3000/pages/about](http://localhost:3000/pages/about)）。

確認できました。

![作成したページにアクセス](https://i.gyazo.com/c666c3f208d99cf503e4f72021b1c2ae.png)

## 作成したページへリンクを貼る

作成したページのパスは `page_path('about')` となります。なのでリンクは、

### erb

```
<%= link_to 'about', page_path('about') %>
```

### haml、slim

```
= link_to 'about', page_path('about')
```

と、書きます。

## 作成したページの URL から /pages を削除

今のままだと `http://localhost:3000/pages/about` という URL になってますが、この `pages` がいらない！ `http://localhost:3000/about` がいい、ってこともあります。

その場合、`config/initializers/` ディレクトリの中に `high_voltage.rb` というファイルを作成して、そこに

```ruby
HighVoltage.configure do |config|
  config.route_drawer = HighVoltage::RouteDrawers::Root
end
```

と、書きます。

それから Rails を再起動すると、`http://localhost:3000/about` に URL が変わります。

URL が変わっても、パスの書き方は `page_path('about')` のまま。

## 階層を作る

例えば、`http://localhost:3000/help/post` や、`http://localhost:3000/help/read` のような階層を作る場合、静的ページを入れている `app/views/pages/` の中に `help` ディレクトリを作って、その中に `post.html.erb`（もしくは、`post.html.haml`、`post.html.slim` など）、 `read.html.erb`（もしくは、`read.html.haml`、`read.html.slim` など）を入れます。

すると、`http://localhost:3000/help/post` 、`http://localhost:3000/help/read` にアクセスできるようになります。

リンクを貼るときのパスの書き方は `page_path('help/post')` 、 `page_path('help/read')` となります。


<div class="amazlet-box" style="margin-bottom:0px;"><div class="amazlet-image" style="float:left;margin:0px 12px 1px 0px;"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4902800128/machidateppei-22/ref=nosim/" name="amazletlink" target="_blank"><img src="http://ecx.images-amazon.com/images/I/51WJT3gZ7rL._SL160_.jpg" alt="映像夜間中学講義録 イエスタディ・ネヴァー・ノウズ(DVD付）" style="border: none;" /></a></div><div class="amazlet-info" style="line-height:120%; margin-bottom: 10px"><div class="amazlet-name" style="margin-bottom:10px;line-height:120%"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4902800128/machidateppei-22/ref=nosim/" name="amazletlink" target="_blank">映像夜間中学講義録 イエスタディ・ネヴァー・ノウズ(DVD付）</a><div class="amazlet-powered-date" style="font-size:80%;margin-top:5px;line-height:120%">posted with <a href="http://www.amazlet.com/" title="amazlet" target="_blank">amazlet</a> at 16.07.19</div></div><div class="amazlet-detail">根本敬 <br />K&Bパブリッシャーズ <br />売り上げランキング: 303,534<br /></div><div class="amazlet-sub-info" style="float: left;"><div class="amazlet-link" style="margin-top: 5px"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4902800128/machidateppei-22/ref=nosim/" name="amazletlink" target="_blank">Amazon.co.jpで詳細を見る</a></div></div></div><div class="amazlet-footer" style="clear: left"></div></div>
