---
title: Sass初心者のためのmixin講座 3
tags: sass
published: false
---

ここ一年ちょいくらい、[oulu](https://github.com/oulu/oulu)っていうSassのツールを一人でシコシコ作ってます。

Sassのツールって言うと、[bootstrap](http://getbootstrap.com/)や[Foundation](http://foundation.zurb.com/)みたいな、「これを使えばCSS（Sass）を書かなくてもデザインが入る！」ってやつを想像されることが多いのですが、ouluはそういうのじゃなくて、Sassを書くのを楽にするツール、要するにSassを短く書くためのmixin集です。[Bourbon](http://bourbon.io/)とか[Compass](http://compass-style.org/)みたいなやつ。

ただ、BourbonやCompassのmixinは自動でベンダープリフィクスを付けるためのものが多くを占めるんだけど、最近その辺は[autoprefixer](https://github.com/postcss/autoprefixer)を使って対応するのが主流なので、ouluにはベンダープリフィクスを付けるためのmixinは含んでないです。単純にSassを短く書くためだけに注力しています。

普段、仕事などで一緒にいる人の大半がエンジニアさんなのですが、割とみんなSassやCSSに興味がないので（だから僕がこの仕事に呼ばれてるんですけどね）、頑張ってcommitしてるouluについて無理やり自慢をしても、何を頑張ってるのかイマイチ伝わらないです。なので、今回は実際どんなものを作ってるのかの例を紹介してみよう、って話。ついでに、ここ最近Sassを触り始めた人にとっても、Sassってこういうことが出来るのかー、ってのの参考になればと思い、詳しく書いてみました。

## positionを一行で書きたい

sassに `position: absolute` って書いたらほとんどの場合、`left: 2rem` だとか、 `top: 1.5rem` だとかの `位置: 値` も書くんですよね。ほとんどそれらがセットなのに、そのために3行も使うのが個人的にイヤ（異論は認めますよ）。

```sass
.absolute-block
  position: absolute
  left: 2rem
  top: 1.5rem
```

さらにsass-lintなんかを使ってて、「sassのプロパティはアルファベット順に書かないと警告が出る」なんてルールが設定してあったら、

> えーと、まずは `position: absolute` にして、
> 次にー、左右の位置はこの辺だから `left: 2rem`、と、
> よーしよーし、それで... 上下の位置はこの辺だから `top: 1.5rem`、かなー？...
> うーん、いいね！

...みたいなことを考えながら位置を合わせてるのですが、考え方の順番と一致しなくなって書きにくいんですよね。書いてから修正するのも面倒だし、コードを読むときも、考え方と同じ順番で書いてないと行ったり来たりしなくちゃなんないので面倒。だったら、それらをまとめて一行に書きたい、ついでに `z-index` も一緒に一行に書きたい、って思います。

## ざっくりmixinにしてみる

```sass
=position($position: null, $left: null, $top: null, $right: null, $bottom: null, $z-index: null)
  position: $position
  left: $left
  right: $right
  top: $top
  bottom: $bottom
  z-index: $z-index
```

実際に使うと、

```sass
.absolute-block
  +position(absolute, 2rem, 1.5rem, null, null, 100)
```

こうSassを書いて、

```css
.absolute-block {
  position: absolute;
  left: 2rem;
  top: 1.5rem;
  z-index: 100;
}
```

こういうCSSが生成される。

positionってmixinを作って、ざーっと、愚直に引数を設定。値が `null` のプロパティはCSSに書き出されないので、引数のdefault値には `null` を入れておきました。まぁ、これはこれで機能はするかと思うんだけどイマイチ。イマイチなポイントをあげてみます。

### イマイチポイント

- `$left` , `$top` , `$right` , `$bottom` の値が全部必要なことなんて、そうはないから、ほとんどの場合、どこかしらに `null` って書かなくてはいけなくなる。なんかわからないけど、個人的にmixinを使うときに `null` って書かせたら負けって思ってしまう。必要ないなら何も書かないで済ませたいじゃん、みたいな。
- カンマが多過ぎて引数の順番を間違えそう。

### 改善案

イマイチな点を解決するため、`position` 、 `left top right bottom` 、 `z-index` のうち必要なものだけを引数として順番関係なく渡すことにします。そうすれば、不要なプロパティに `null` って書く必要ないし、順番も関係無くすれば引数の順番を間違えることもなくなって問題解消。必要なものを思いついた順番に詰め込んだ引数たちを `@each` で順番に流し込んで（下の画像のベルトコンベアみたいなイメージ）、 `@if` 、 `@else if` たちに仕分けをさせるってイメージのmixinに作り直します。

#### @if、@else if の仕分け作業の内容

- プロパティ `position` の値（ `static` or `relative` or `absolute` or `fixed`）だったら、`position` の値にする。
- 2つの値の組み合わせだったら、1つ目をプロパティを「位置（ `left` or `top` or `right` or `bottom` ）」 にして、もう一つを「位置の値」とする（例: `left: 2rem`）。
- 単位を持たない数字だったら、 `z-index` の値にする。

### こんなイメージ

![sassのイメージ](https://lh3.googleusercontent.com/S4p7M6xYsKuqHhoSjVREf2THarhsgBu0NX55CCMtzL-oVa-1TfQIOWFPuClTjanW0DM_zIGZuegAwXmP181WOdLwlmROYfy3Iv1E8GVqAnaFDIjAbXUtCvDydIihPLEau0YwqoCgRtlweV5yR4mT_o-7A-fALSV2ComHqU7J5i69y0HaLIBRnqSvJhOQ6MeiD9rCPUEDEyJMDvmO3lXifsYYV49_reaNqVHBisUD4j1MShJl4ChgdXovsUjXh7DGZpJQ0atHTnZyv8qXKJjUvUo3FQTVD8UhYDaPUkJNee_TTMBdAKIsE6jiiKi74HAXW3gwtJbeaHRfXt4MAN5EQzf-CJ_k2qnFgHYbe5KzQbQbmgVQnZG-MlAKMcbMIMzrI8_Rt893E_0fWNY3Irn8O0EgZvwFTIEtTQcS0KB-FVPVOS3kU0iW3q4SCIP-kvAF5QrWVMcKooq2bYxMk9T0cmlwlpyufs7zDWKuHI9zxzv6KO3NaOKMJ_qcpEyBkfrRDuzyYmQfb11W-iPgyiLbwm2UFIwRd32T8eWcbKZRQkxZBpLpwHQBclIXK09oZMxBbi99=w1800-h1000-no)

では、実装していきましょう。

## mixinの仕様

まずは、mixin の本体。引数 `$values` にベルトコンベア（@each）に流す引数を詰め込んでいきます。

```sass
=position($values...)
```

実際に使う時は、

```sass
.absolute-block
  +position(absolute, left 2rem, top 1.5rem, 100)
```

と書くと、引数がうまく仕分けされて、

```css
.absolute-block {
  position: absolute;
  left: 2rem;
  top: 1.5rem;
  z-index: 100;
}
```

こういうCSSが生成される（イマイチmixinの例と結果は同じになる）。

## mixinに渡す引数

まずは、イマイチmixinと改善後のmixinのそれぞれに渡す引数を見比べてみましょう。

イマイチmixin

```sass
=position($position: null, $left: null, $top: null, $right: null, $bottom: null, $z-index: null)
```

`$position: null, $left: null, $top: null, $right: null, $bottom: null, $z-index: null` こんな風に異様に長い引数を渡してました。

一方、改善後のmixinは、

```sass
=position($values...)
```

引数は、 `$values...` としか書いてません。しかも `...` とピリオドが3つ打たれてます。これって何？って解説をここでしておきます。

### 可変長引数

今回、イマイチな点を解決するため、position 、 left top right bottom 、 z-index のうち必要なものだけを引数として順番関係なく渡すことにしました。ということで、引数がいくつ渡されるかはシチュエーションによって異なります。

例えば、

```css
.block {
  position: absolute;
  left: 2rem;
  top: 1.5rem;
  z-index: 100;
}
```

というCSSを生成したい場合、

```sass
.block
  +position(absolute, left 2rem, top 1.5rem, 100)
```

`absolute, left 2rem, top 1.5rem, 100` 4つの引数を渡します。

ところが、

```css
.block {
  position: fixed;
  left: 0;
  top: 0;
  right: 0;
  bottom: 0;
  z-index: 100;
}
```

このようなCSSを生成したい場合、

```sass
.block
  +position(fixed, left 0, top 0, right 0, bottom 0, 100)
```

`fixed, left 0, top 0, right 0, bottom 0, 100` 6つの引数を渡します。

こんな場合もあります。

```sass
.block
  +position(absolute, left -20rem, top 0, 100)
  &.is-slide-in
    +position(left 0)
```

というように、引数がいくつ渡されるかはシチュエーションによって異なります。これの何が問題かというと、例えば、5つの引数の入れ物（ `$value1` 〜 `$value5` ）を用意した場合、

```sass
=position($value1: null, $value2: null, $value3: null, $value4: null, $value5: null)
```

それぞれデフォルト値は `null` を持っているので、下の例の用に5つを使い切らず、4つの引数を渡しても問題なくmixinが使えます。

```sass
.block
  +position(absolute, left 2rem, top 1.5rem, 100)
  // 引数の入れ物は5つだけど、デフォルト値に null が入ってるので、渡す引数が5つ未満でもOK。
```

ところが、5つの引数の入れ物しかないのに、それを超える個数の引数（下記の例では6つの引数）を渡した場合、エラーが出てしまいます。

```sass
.block
  +position(fixed, left 0, top 0, right 0, bottom 0, 100)
  // 引数の入れ物が5つしかないので、エラーが出る。
```

じゃあ、いくつ引数が渡されてもエラーが出ないように、引数の入れ物をたくさん用意しとけばいいじゃん、と、

```sass
=position($value1: null, $value2: null, $value3: null, $value4: null, $value5: null, $value6: null, $value7: null, $value8: null, $value9: null, $value10: null)
```

こんな風にしたら、これはこれでちゃんと動きはするのですが、すごく格好悪いし、mixinを作るのが面倒になります。

ここで、使うのが `...` という「ドット3つ」の記号。これを引数名の書くと、ここにはいくつでも引数が入れられるようになります。

```sass
=position($values...)
```

これをvariadic function（可変長引数）というそうです。

## @each

続いて、上記「こんなイメージ」の画像のベルトコンベアの部分、`@each` を書いてみると、

```sass
=position($values)
  @each @value in @values
```

こうなります。`$values` の中の引数たちを一つずつ、`$value` という箱（「こんなイメージ」の画像だと青い箱）に入れて、`@each` というベルトコンベアに流すイメージ。

ちなみに、Sassの `@if` 、 `@for` 、 `@each`、 `@while` について詳しく知りたいかたは[こちらの記事（Sass control directives: @if, @for, @each and @while）](http://thesassway.com/intermediate/if-for-each-while)がオススメ。

## @if プロパティpositionの値だったら

次は仕分け作業。最初の仕分け作業は「もし、`$value` がプロパティ `position` の値だったら」という条件で、「`$value` はプロパティ `position` の値にする」っていう仕分けを行います。「`$value` がプロパティ `position` の値だったら」、とは具体的にはどういう条件なのか？を考えてみます。

プロパティ `position` に使える値は、

- `static`
- `relative`
- `absolute`
- `fixed`

の4種類ですね。なので、具体的には、`$value` が `static` 、 `relative` 、 `absolute` 、 `fixed` のいずれかだったら、 `position: $value` とする、という条件になります。

実際にSassで書いてみると、

```sass
@if $value == 'satatic' or $value == 'relative' or $value == 'absolute' or value == 'fixed'
  position: $value
```

と、なります。ひとつ目の仕分け条件のSass化完了。

## @else if 2つの値の組み合わせだったら、1つ目をプロパティ「位置」 にして、もう一つを「位置の値」とする

次の仕分け作業は、「もし、 `$value` が2つの値の組み合わせだったら」という条件で、「`$value` の1つ目の値をプロパティを「位置（ `left` or `top` or `right` or `bottom` ）」 にして、`$value` のもう一つの値を「位置の値」とする」という仕分けをします。まずは条件の部分、「2つの値の組み合わせだったら」ってところから。

### Sassのfunctionの使い方

「もし、 `$value` が2つの値の組み合わせだったら」という条件には、Sassのfunctionを使います。ちょっとここで、Sassのfunctionの使い方の簡単な説明を。

Sassのfunctionは、functionの後ろにカッコを書いて、その中にfunctionに渡したい値を入れます。すると、functionがその値を変換して別のものにして返してくれます。

例えば、 `round` という小数点第一位を四捨五入するfunctionがあります。これを使うには、`round` の後ろにカッコを書いて、その中に数字を入れます。すると、カッコの中に入れた数字が変換されて、小数点第一位が四捨五入された数字が返ってきます。

```sass
round(71.1)
// 71が返ってくる。

round(71.5)
// 72が返ってくる。

round(71)
// 71が返ってくる。
```

こうやって使います。

### Sassのfunctionをコマンドラインで試す

ちなみに、Sassはコマンドラインで動かす機能が入ってます。Sassが使える環境で、

```shell
$ sass -i
```

と、打つと、

![ターミナル md](https://lh3.googleusercontent.com/Htn7eaKyCb7MfOtJsNxim9zv0gBWjjvFy3XOt9wol4FQeMWJmlBf1tfoGnI-w8CDVdLP_hzsNE7gpZBC9V-nKCPUaTAukXGQf72rfseF68gxYFLRoH-UAJAsF9iBcuF6_K4Eq8Cly9sh7exZqDGZqmQU81d-wejKE41isSN0qeswf399Q5M0RYqEK_exS2d9oazeZdDRttyFdcq3bVmPg5x8KWNgVNoO3DPpWK-kYgHiwpbrYjy8_P7BGo_6o-7E_TdOSqisxit99EUmYMG9GbfYhoawjtFxGUsXgi94K3CA8RYzaSUKbYAXOWHSSv88L_jMwx8RYZ6H6D_2RV90TxCntMikex9s3KMBn-r26Kh1j8FSzD6JH6_5Dnmn_hUxfugK8KQDULdvjma_rOPs5pxfx8KjoUIRn99kkRpCsf10-Q5YGkBigqSIW1RxD8-C5AOpE3YYPvh1bhNAJM85IChAVqbyYLG5mpHFrpaHjfC7gSO67amA1UV72fkSnfTRN2xU3we3AO8-tvj-9CYeXtufJK27sE5J-F0HC5PC6-GX0RXTQT5Uf9sZsSxy2I2q74Xk=w571-h396-no)

って感じで、`>>` と出るので、そこに例えば上記のfunctionの例、`round(71.1)` と入力してみると、

![ターミナル md](https://lh3.googleusercontent.com/qakoJ4oq6tJVr3toUazb0yjuG1sQNixWsnfAIktPVC5FyL0TyHp_tMFNG9LW557RcBhWvHzUoSIBMNYtKowuXpEneZP5ZA46bBJRgLDcKBZZMkIXbof4iFhMN2UIrgYaYkNYmdpLdn3tChaxLpKEjxk-_wjQKatGr7wOZ9kVY6UeMVELjsxVw5f0qP-hNO4mxsyx-AgLWP9to9roEvHPLGtnmwnC0QX4ZyPpo5txtNRZJNk_G8zSNKEjEHL4mt5ZK_tQeg46KGwCSlYoirl2m2xJhg2SvGur11Jsj03ELNAaDspxgV6SOL-5xCSmXRjjDLnWxnXnsbUQj19TwXsRIFbX8YAhGag4iVbe9h9cnpThhRCEhfR7lEF4vJem1gP-KuST6kB2WrsTDZeVSXzauktTrWcpc3reGCnylgK3GZ-t-Pqahi0hRM09IsDUpG8PA8V4608dL9Q22WBGF5yWRavY3n7ECfQSRcZSX7ObVryBKoSD4JExk7ABAcQNKLvSmEpvt0FkrR80SMx4nyw8iljNYiHkFsD-Zw-KYP_s5eeIGtTBoeZXqvueE14vTtty77ge=w571-h396-no)

この様に結果を表示してくれます。便利！

### functionを自作してみよう

functionが出てきたところで、

### Sassのfunction、length

だいぶ脱線しましたが、話を戻して、「もし、 `$value` が2つの値の組み合わせだったら」という条件をSassでどうやって実装するのか、の話。

この条件は、Sassに始めから用意されているfunction `length` を使って実装します。 `length` とはどんなfunctionかというと、リストを渡すと、そのリストにある値の数を返すというfunction。言葉で説明してもわかりづらいので、例を用意しました。`$ sass -i` で試してみてください。

```
length(Emerson Lake Palmer)
// 3が返ってくる。

length(Emerson Lake)
// 2が返ってくる。

length(Emerson)
// 1が返ってくる。

length((Emerson, Lake, Palmer))
// 3が返ってくる。
// カンマ区切りのリストの場合、リスト全体をカッコで囲わないとSyntaxErrorになる。
```

こういうfunctionです。

### lengthを使って、Sassを書いてみる

「2つの値の組み合わせだったら」は、

```sass
@else if length($value) == 2
```

と、なります。うん、簡単。

## 1つ目をプロパティ「位置」 にして、もう一つを「位置の値」とする

続いて、「1つ目をプロパティ「位置」 にして、もう一つを「位置の値」とする」の仕分け作業の実装。

### nth

「1つ目」、「2つ目」をSassで表現するには、`nth` というfunctionを使います。 `nth` とは、今回のような2つ以上値があるときに、それのn番目の値だけを抜き出すっていうfunction。またもや言葉じゃ説明しづらいので、`length` と同様に例を用意。

```
nth(Emerson Lake Palmer, 1)
// リスト [Emerson Lake Palmer] の1番目である Emerson が返ってくる。

nth(Emerson Lake Palmer, 2)
// リスト [Emerson Lake Palmer] の2番目である Lake が返ってくる。

nth((Emerson, Lake, Palmer), 3)
// リスト [(Emerson, Lake, Palmer)] の3番目である Palmer が返ってくる。
// カンマ区切りのリストの場合、リスト全体をカッコで囲わないとSyntaxErrorになる。
```

こういうfunctionです。

### nthを使って、Sassを書いてみる

「1つ目をプロパティ「位置」 にして、もう一つを「位置の値」とする」 は、

```sass
#{nth($value, 1)}: nth($value, 2)
```

と、なります。「lengthを使って、Sassを書いてみる」のときは、CSSの値のほうにしか、 `$value` が入ってこなかったけど、今回はプロパティのほうにも `$value` が入ってきます。プロパティで引数の値を使う場合は、`#{}` で囲う必要があります。なので、 `#{nth($value, 1)}` と書きます。「@else if 2つの値の組み合わせだったら、1つ目をプロパティ「位置」 にして、もう一つを「位置の値」とする」全部をつなげると、

```sass
@else if length($value) == 2
  #{nth($value, 1)}: nth($value, 2)
```

こうなります。

ここまで作ったmixinをつなげると、

```sass
=position($values)
  @each @value in @values
    @if $value == 'satatic' or $value == 'relative' or $value == 'absolute' or value == 'fixed'
      position: $value
    @else if length($value) == 2
      #{nth($value, 1)}: nth($value, 2)
```

こうなります。なんかプログラムっぽい感じの見た目になってきた！

## @else if 単位を持たない数字だったら、z-indexの値にする

いよいよ最後の仕分け作業、「 `$value` が単位を持たない数字だったら」という条件で、 「`z-index` の値にする」、という仕分けを行います。ここまで来ると、「単位を持たない数字だったら」も、それを判別するfunctionが用意されてるんでしょ、って思われるかもしれないですが、期待通り、ちゃんとSassが用意してくれてます。

### unitless

`unitless` というfunctionがあって、これに数字を渡すと、その数字が単位（unit）を持っていたら `false` を返し、その数字が単位を持っていなかったら `true` を返します。今回は言葉でもそこまでわかりにくくなかったけど、念のため例を用意しました。

```
unitless(1)
// 1に単位はないのでtrueが返ってくる。

unitless(1px)
// 1pxは、単位pxを持っているので、falseが返ってくる。

unitless(red)
// 数字ではない値を渡しているのでSyntaxErrorになる。
```

こういうfunctionです。

### unitlessを使って、Sassを書いてみる

「 `$value` が単位を持たない数字だったら」をSassで書くと、function `unitless` に渡して `true` が返ってきたら、となるので、

```sass
@else if unitless($vlue)
```

と、書きます。「`true` が返ってきたら」という条件は、 `@else if unitless($vlue) == true` と書く必要はなくて、 `@else if unitless($vlue)` だけでOKです。

ただ、ここで心配なのが、`unitless` に数字ではない値を渡すとSyntaxErrorになってしまいます。SyntaxErrorにならないように、条件をもっと厳密にして、「`$value` が数字で、なおかつ単位を持たない数字だったら」と、します。つまり、数字以外の値が `unitless` に渡されることを防ぐようにします。

### type_of

「`$value` が数字で」という条件をSassで書くには、 `type_of` というfunctionを使います。 `type_of` は、渡された値のtypeを返すfunctionです。Sassにはdata typeってものがあって、まぁ要するに値のカテゴリー分けです。

種類を一覧すると、

- number
- string
- bool
- color
- list
- map
- null

7種類のdata typeがあります。

ではでは、`type_of` の例を見てみましょう。`type_of` は mixin や 自作の function を作るときにかなりよく使うので、ぜひ `$ sass -i` で色々試してどんな値が返ってくるか知っておくのがオススメ。

```
type-of(100px)
// 100pxは数字なのでnumberが返ってくる。

type-of(left)
// leftは文字列なので、stringが返ってくる。

type-of("left")
// クオートで囲ってもstringが返ってくる。

type-of(true)
// true、falseを渡した場合は、boolが返ってくる。

type-of(false)
// true、falseを渡した場合は、boolが返ってくる。

type-of(#fff)
// #fffは色なので、colorが返ってくる。

type-of(blue)
// blueは色なので、colorが返ってくる。

type-of(blue red)
// 渡した値が複数あるので、listが返ってくる。

type-of((blue, red))
// カンマ区切りのリストはカッコで囲わないとSyntaxErrorになる。

type_of((color: blue))
// コロン区切りの「key: value」は、mapが返ってくる。
// mapもカッコで囲わないとSyntaxErrorになる。

type_of((danger: blue, safe: red))
// コロン区切りの「key: value」は、mapが返ってくる。
// mapもカッコで囲わないとSyntaxErrorになる。

type_of((color: blue, color: red))
// keyが重複しているとSyntaxErrorになる。

type_of(null)
// nullを渡すとnullが返ってくる。

type_of(null null)
// nullしかないリストを渡すと、listが返ってくる。
```

こんな風にtypeを返すfunctionです。

### type_ofを使って数字だったら、と実装する

`type_of` を使ってSassで書くと、

```sass
@else if type_of($value) == number and unitless($vlue)
```

こうなります。
