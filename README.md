# Merienda (メリエンダ)
お菓子屋さんのためのお菓子作りサポートアプリ

## ターゲット
- お菓子を作って販売している友人
- プロフィール
  - 20代、女性
  - 不定期にお菓子を作って納品販売している

## ユーザーの課題
- お菓子の試作をする際に、毎回材料の分量を変えて作るため、試作レシピが大量になり管理が大変（現在手書き）
- 分量が変わるたびに原価計算をするのが大変
- 既存アプリは飲食店向けで、小売販売のお菓子屋には不必要な機能が多い（栄養表示など）

## なぜそれを解決したいのか？
- 材料やレシピの管理が煩雑だと困っていたから
- 分量を変えて作った際に、毎回原価計算をするのが面倒だと困っていたから
- シンプルで使いやすい既存アプリが無いと困っていたから

## 解決方法
- お菓子作りに特化して機能を絞ったシンプルな管理アプリを作る

## 機能要件
- 登録機能: ユーザー名とパスワードによるログイン機能
- 材料登録: 材料とその1g当たりの原価を登録。
- レシピ登録: レシピ名、メモ、材料の分量、作り方を登録。
- 原価計算:　等分の変更に対応した原価計算。

## 非機能要件
- 保守性：静的解析ツールを導入してコードの品質を保つ（RuboCop）
- レスポンシブ：スマホでの利用を想定してレスポンシブ対応

## 使用技術
- Ruby 3.1.4
- Rails 7.0.6
- MySQL 8.0.33

## 設計

<a href="https://www.figma.com/file/tz8yBTDCuOUBLCqykFeuNf/%E6%A5%AD%E5%8B%99%E3%83%95%E3%83%AD%E3%83%BC%E5%9B%B3?type=design&t=dsxdGjmPUi7EEkix-1">業務フロー図</a>

<a href="https://www.figma.com/file/CaEePGJb9mDugCBRDUiZWJ/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?type=design&node-id=0%3A1&t=dsxdGjmPUi7EEkix-1">画面遷移図</a>

<a href="https://www.figma.com/file/MHUESDNNKB1b8hxnpSHgnO/%E3%83%AF%E3%82%A4%E3%83%A4%E3%83%BC%E3%83%95%E3%83%AC%E3%83%BC%E3%83%A0?type=design&t=dsxdGjmPUi7EEkix-1">ワイヤーフレーム</a>

<details>
  <summary>テーブル定義</summary>

Users テーブル（ユーザー）
|カラム名	| データ型	| NULL	| キー	| 初期値	| AUTO INCREMENT|
|---|---|---|---|---|---|
|id	|INT	|NOT NULL	|PRIMARY KEY	|	|YES|
|username	|VARCHAR(255)	|NOT NULL	|UNIQUE	|	||
|password	|VARCHAR(255)	|NOT NULL	|	|	||
|created_at	|DATETIME	|NOT NULL	|	|	||
|updated_at	|DATETIME	|NOT NULL	|	|	||

Ingredients テーブル（材料）
|カラム名	| データ型	| NULL	| キー	| 初期値	| AUTO INCREMENT|
|---|---|---|---|---|---|
|id	|INT	|NOT NULL	|PRIMARY KEY	|	|YES|
|user_id	|INT	|NOT NULL	|FOREIGN KEY	|	||
|name	|VARCHAR(255)	|NOT NULL	|	|	||
|cost_per_gram	|DECIMAL(10,2)	|NOT NULL	|	|	||
|created_at	|DATETIME	|NOT NULL	|	|	||
|updated_at	|DATETIME	|NOT NULL	|	|	||
- 外部キー制約：user_id は Users テーブルの id に紐づく

Recipes テーブル（レシピ）
|カラム名	| データ型	| NULL	| キー	| 初期値	| AUTO INCREMENT|
|---|---|---|---|---|---|
|id	|INT	|NOT NULL	|PRIMARY KEY	|	|YES|
|user_id	|INT	|NOT NULL	|FOREIGN KEY	|	||
|title	|VARCHAR(255)	|NOT NULL	|	|	||
|notes	|TEXT	|	|	|	||
|created_at	|DATETIME	|NOT NULL	|	|	||
|updated_at	|DATETIME	|NOT NULL	|	|	||
- 外部キー制約：user_id は Users テーブルの id に紐づく

RecipeMethod テーブル（レシピの作り方）
|カラム名	| データ型	| NULL	| キー	| 初期値	| AUTO INCREMENT|
|---|---|---|---|---|---|
|id	|INT	|NOT NULL	|PRIMARY KEY	|	|YES|
|recipe_id	|INT	|NOT NULL	|FOREIGN KEY	|	||
|process	|TEXT	|	|	|	||
|created_at	|DATETIME	|NOT NULL	|	|	||
|updated_at	|DATETIME	|NOT NULL	|	|	||
- 外部キー制約：recipe_id は Recipes テーブルの id に紐づく

RecipeIngredients テーブル（レシピごとの材料とその量）
|カラム名	| データ型	| NULL	| キー	| 初期値	| AUTO INCREMENT|
|---|---|---|---|---|---|
|id	|INT	|NOT NULL	|PRIMARY KEY	|	|YES|
|recipe_id	|INT	|NOT NULL	|FOREIGN KEY	|	||
|ingredient_id	|INT	|NOT NULL	|FOREIGN KEY	|	||
|quantity_in_grams	|DECIMAL(10,2)	|NOT NULL	|	|	||
|created_at	|DATETIME	|NOT NULL	|	|	||
|updated_at	|DATETIME	|NOT NULL	|	|	||
- 外部キー制約：recipe_id は Recipes テーブルの id に紐づく
- 外部キー制約：ingredient_id は Ingredients テーブルの id に紐づく
</details>

<details>
  <summary>ER図</summary>

![Alt text](./documents/img/ER.png)
</details>

<details>
  <summary>システム構成図</summary>
<img src="./documents/img/%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0%E6%A7%8B%E6%88%90%E5%9B%B3.png" width="500px">
</details>
