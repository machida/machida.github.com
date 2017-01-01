---
title: Rails でアンカー付きのリンクの書き方
tags: rails
---

Rails の `link_to` を使って、`<a href="/page#content"></a>` のように、ページの途中にリンクを貼る方法をよく忘れるのでメモ。

## 書きかた

### erb

```ruby
<%= link_to 'aタグのアンカーテキスト', リンク先のページのpath(anchor: 'リンク先のページの途中のID'), class: 'aタグのクラス名' %>
```

#### 例

```ruby
<%= link_to '通知設定変更', edit_user_registration_path(anchor: 'notifications'), class: 'edit-notification__link' %>
```


### haml、slim

```ruby
= link_to 'aタグのアンカーテキスト', リンク先のページのpath(anchor: 'リンク先のページの途中のID'), class: 'aタグのクラス名'
```

#### 例

```haml
= link_to '通知設定変更', edit_user_registration_path(anchor: 'notifications'), class: 'edit-notification__link'
```

## 出力されるHTML

```html
<a href="/users/edit#notifications" class="edit-notification__link">通知設定変更</a>
```

<div class="amazlet-box" style="margin-bottom:0px;"><div class="amazlet-image" style="float:left;margin:0px 12px 1px 0px;"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/B00R3VL3WI/machidateppei-22/ref=nosim/" name="amazletlink" target="_blank"><img src="http://ecx.images-amazon.com/images/I/51BfSkGma-L._SL160_.jpg" alt="人生解毒波止場 (幻冬舎文庫)" style="border: none;" /></a></div><div class="amazlet-info" style="line-height:120%; margin-bottom: 10px"><div class="amazlet-name" style="margin-bottom:10px;line-height:120%"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/B00R3VL3WI/machidateppei-22/ref=nosim/" name="amazletlink" target="_blank">人生解毒波止場 (幻冬舎文庫)</a><div class="amazlet-powered-date" style="font-size:80%;margin-top:5px;line-height:120%">posted with <a href="http://www.amazlet.com/" title="amazlet" target="_blank">amazlet</a> at 16.07.15</div></div><div class="amazlet-detail">幻冬舎 (2014-12-26)<br />売り上げランキング: 16,664<br /></div><div class="amazlet-sub-info" style="float: left;"><div class="amazlet-link" style="margin-top: 5px"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/B00R3VL3WI/machidateppei-22/ref=nosim/" name="amazletlink" target="_blank">Amazon.co.jpで詳細を見る</a></div></div></div><div class="amazlet-footer" style="clear: left"></div></div>
