
# アプリケーション名:『Habits』
<img width="1680" alt="スクリーンショット 2022-07-24 6 54 50" src="https://user-images.githubusercontent.com/73205589/180624119-0e96aac9-befb-4da8-93c5-d1255589c0a7.png">  
<br />
<br />

# 概要
習慣化をサポートするアプリケーションです。  
そのため習慣を作り、記録して、共有することができます。  
<br />
習慣化できるポイントを３つ取り入れました。  
１,簡単に続けられるために、最短４クリックで記録できること。  
２,モチベーションを上げるために、習慣達成状況を可視化する。(記録した日をカレンダーに表示する、記録回数に応じて習慣のレベルが上がる)  
３,挫折しずらい環境を作るために、ユーザー登録機能でピアプレッシャーを与える。
<br />
<br />
  
# 本番環境
https://habitsrecords.com
<br />
<br />

# 機能一覧
・ユーザー登録、ログイン機能(devise)  
・習慣作成機能(CRUD)  
　-レベルアップ機能  
・習慣記録機能(CRUD)  
　-画像投稿機能(ActiveStorage)  
　-いいね機能(Ajax)  
　-ページネーション機能(kaminari)  
・カレンダー機能(fullcalendar)  
<br />
<br />

# 技術一覧
・Ruby 2.6.5  
・Rails 6.0.4.1  
・JavaScript  
・Bootstrap5  
・MySQL 5.6.51  
・Nginx  
・Unicorn  
・AWS
<br />
<br />

# DB設計
## users テーブル

| Column             | Type        | Options                |
| -------------------|-------------| -----------------------|
| email              | string      | null: false            |
| password           | string      | null: false            |
| nickname           | string      | null: false            |


### Association

- has_many :habits
- has_many :records
- has_many :likes

## habits テーブル

| Column      | Type       | Options                        |
| ------------| -----------| -------------------------------|
| title       | string     | null: false                    |
| content     | string     | null: false                    |
| level       | integer    |                                |
| exp_sum     | integer    |                                |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :records

## records テーブル

| Column     | Type       | Options                        |
| -----------| -----------| -------------------------------|
| text       | string     | null: false                    |
| exp        | integer    |                                |
| user_id    | references | null: false, foreign_key: true |
| habit_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :habit
- has_many   :likes

## likes テーブル

| Column        | Type       | Options                        |
| --------------| -----------| -------------------------------|
| user_id       | references | null: false, foreign_key: true |
| record_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :record
<br />
<br />

# インフラ構成図
![インフラ構成図](https://user-images.githubusercontent.com/73205589/180623547-47c78471-7c4f-4527-a89d-8da24bb1357b.jpg)
