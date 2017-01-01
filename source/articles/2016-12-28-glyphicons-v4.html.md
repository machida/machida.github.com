---
title: bootstrap v4 で glyphicons を使う
tags: bootstrap rails
---

## 公式の bootstrap gem

bootstrap の公式 gem があって、Rails で bootstrap を使う場合はこれを使ってます（ [bootstrap-rubygem](https://github.com/twbs/bootstrap-rubygem)）。

ただ、この bootstrap-rubygem は bootstrap v4 なので、古いバージョンの bootstrap を使ってるプロジェクトの場合、これを導入するには v4 に合わせて html のマークアップを更新しないといけないです。v4 になって、色々変わってるところがあるんですが、大きい変更の一つに glyphicons がなくなった、っていうのがあります。

glyphicons を使っているプロジェクトの場合、アイコンを font-awsome に変えるなどの方法はあるのですが、アイコンのデザインが変わってしまうのでデザインに影響します。今回はおとなしく bootstrap を更新するために、 bootstrap v4 で glyphicons を使う方法をメモ。

## Rails で公式の bootstrap gem を使う

Gemfile に、

```ruby
gem 'bootstrap', '~> 4.0.0.alpha5'
```

を追加して、

```shell
$ bundle install
```

その後、`application.scss` （もしくは、`application.sass`）から bootstrap を import。

```scss
// scss の場合
@import "bootstrap";
```

（実際は、bootstrapをそのまま import するのではなくて、変数を変えたり、必要なスタイルだけを import するんですが、今回は省略。）

`application.js` にも  bootstrap を require。

```javascript
//= require jquery
//= require bootstrap-sprockets
```

ツールチップを使う場合、[Tether](http://tether.io/) という [HubSpot](http://product.hubspot.com/) が作ってるライブラリが必要になるので、それも入れる必要があります。

Gemfile に

```ruby
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end
```

を追加して、

```shell
$ bundle install
```

その後、`application.js` に tether を require。

```javascript
//= require jquery
//= require tether
//= require bootstrap-sprockets
```

これで bootstrap v4 の導入完了。

## bootstrap v4 で glyphicons を使う

続いて、bootstrap v3 から glyphicons のファイルを取ってきます。
