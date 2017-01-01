---
title: bootstrap の media-query をまとめ scss 版
tags: sass
---

## bootstrap v3

### xs - phone（480px 〜 767px）

```scss
$screen-xs: 480px
$screen-xs-min: 480px
$screen-xs-max: 767px
```

#### up（480px 〜）

```scss
@media (min-width: $screen-xs-min) { ... }
```

#### down（〜 767px）

```scss
@media (max-width: $screen-xs-max) { ... }
```

#### only（480px 〜 767px）

```scss
@media (min-width: $screen-xs-min) and (max-width: $screen-xs-max) { ... }
```

### sm - tablet（768px 〜 991px）

```scss
$screen-sm: 768px
$screen-sm-min: 768px
$screen-sm-max: 991px
```

#### up（767px 〜）

```scss
@media (min-width: $screen-sm-min) { ... }
```

#### down（〜 991px）

```scss
@media (max-width: $screen-sm-max) { ... }
```

#### only（767px 〜 991px）

```scss
@media (min-width: $screen-sm-min) and (max-width: $screen-sm-max) { ... }
```

### md - desktop（992px 〜 1199px）

```scss
$screen-md: 992px
$screen-md-min: 992px
$screen-md-max: 1199px
```

#### up（992px 〜）

```scss
@media (min-width: $screen-md-min) { ... }
```

#### down（〜 1199px）

```scss
@media (max-width: $screen-md-max) { ... }
```

#### only（992px 〜 1199px）

```scss
@media (min-width: $screen-md-min) and (max-width: $screen-md-max) { ... }
```

### lg - wide desktop（1200px 〜 ∞）

```scss
$screen-lg: 1200px
$screen-lg-min: 1200px
```

#### up（1200px 〜）

```scss
@media (min-width: $screen-lg-min) { ... }
```

#### down（〜 ∞）

```scss
//メディアクエリの指定無し
```

#### only（1200px 〜 ∞）

```scss
@media (min-width: $screen-lg-min) { ... }
```
---

## bootstrap v4

### xs - portrait phones（0 〜 543px）

#### up（0 〜）

```scss
//メディアクエリの指定無し
```

```scss
@include media-breakpoint-up(xs) { ... }
```

#### down（0 〜 543px）

```scss
@media (max-width: 543px) { ... }
```

```scss
@include media-breakpoint-down(xs) { ... }
```

#### only（0 〜 543px）

```scss
@media (max-width: 543px) { ... }
```

```scss
@include media-breakpoint-only(xs) { ... }
```

### sm - landscape phones（544px 〜 767px）

#### up（544px 〜）

```scss
@media (min-width: 544px) { ... }
```

```scss
@include media-breakpoint-up(sm) { ... }
```

#### down（0 〜 767px）

```scss
@media (max-width: 767px) { ... }
```

```scss
@include media-breakpoint-down(sm) { ... }
```

#### only（544px 〜 767px）

```scss
@media (min-width: 544px) and (max-width: 767px) { ... }
```

```scss
@include media-breakpoint-only(sm) { ... }
```

### md - tablets（768px 〜 991px）

#### up（768px 〜）

```scss
@media (min-width: 768px) { ... }
```

```scss
@include media-breakpoint-up(md) { ... }
```

#### down（0 〜 991px）

```scss
@media (max-width: 991px) { ... }
```

```scss
@include media-breakpoint-down(md) { ... }
```

#### only（768px 〜 991px）

```scss
@media (min-width: 768px) and (max-width: 991px) { ... }
```

```scss
@include media-breakpoint-only(md) { ... }
```

### lg - desktops（992px 〜 1199px）

#### up（992px 〜）

```scss
@media (min-width: 992px) { ... }
```

```scss
@include media-breakpoint-up(lg) { ... }
```

#### down（0 〜 1199px）

```scss
@media (max-width: 1199px) { ... }
```

```scss
@include media-breakpoint-up(lg) { ... }
```

#### only（992px 〜 1199px）

```scss
@media (min-width: 992px) and (max-width: 1199px) { ... }
```

```scss
@include media-breakpoint-only(lg) { ... }
```

### xl - large desktops（1200px 〜 ∞）

#### up（1200px 〜）

```scss
@media (min-width: 1200px) { ... }
```

```scss
@include media-breakpoint-up(xl) { ... }
```

#### down（0 〜 ∞）

```scss
//メディアクエリの指定無し
```

```scss
@include media-breakpoint-down(xl) { ... }
```

#### only（1200px 〜 ∞）

```scss
@media (min-width: 1200px) { ... }
```

```scss
@include media-breakpoint-only(xl) { ... }
```

### between

#### between md and lg（768px 〜 1199px）

```scss
@include media-breakpoint-between(md, lg) { ... }
```
