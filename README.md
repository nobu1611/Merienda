# オリジナルプロダクト： Merienda (メリエンダ)

## 一言サービスコンセプト
- お菓子屋さんのためのお菓子作りサポートアプリ

## 誰の？
- お菓子を作って販売している友人
- プロフィール
  - 20代、女性
  - 不定期にお菓子を作って納品販売している

## 課題は？
- お菓子の試作をする際に、毎回材料の分量を変えて作るため、試作レシピが大量になり管理が大変（現在手書き）
- 分量が変わるたびに原価計算をするのが大変
- 既存アプリは飲食店向けで、小売販売のお菓子屋には不必要な機能が多い（栄養表示など）
- 試作中は手を動かしているので、分量のメモを後回しにしていまい、分量を忘れてしまうことがある

## なぜそれを解決したいのか？
- 材料やレシピの管理が大変と言っていたから
- 分量を変えて作った際に、毎回原価計算をするのが大変と言っていたから
- シンプルで使いやすい既存アプリが無いと困っていたから

## どうやって解決するのか？
- お菓子作りに特化して機能を絞ったシンプルな管理アプリを作る

## 機能要件
- 登録機能（ユーザー名、パスワード）
- 材料登録（材料登録時に、一緒に1g単位での原価を登録できる機能）
- レシピ登録（材料の分量、オーブンの温度や時間、作り方が記載できる機能）
- 原価計算機能（ケーキなど等分の変更による価格の変動に対応できるようにする）
- メモ機能
  - 機能ごとに（メーカー、産地など）
  - レシピごとに（料理のコツ、納品詳細 ※大人向けや子供向けのイベントによって大きさを変えている）
  - 音声でメモができるような機能があれば良い（試作の際の覚書）
- 検索機能（材料毎、レシピ毎）

## 非機能要件
- スマホ用にレスポンシブ対応させる
- 運用性：GitHubのメインブランチにマージしたら自動でデプロイされるようにする(GitHub Actions)
- 保守性：静的解析ツールを導入してコードの品質を保つ（RuboCop）
