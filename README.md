
# アプリケーション名:『Habits』

## 概要
望む習慣を定着させるアプリです  
そのため習慣を作り、記録して、共有することができます。

## 本番環境
https://habitsrecords.com

## 機能一覧
・ユーザー登録、ログイン機能(devise)  
・習慣作成機能(CRUD)  
　-レベルアップ機能  
・習慣記録機能(CRUD)  
　-画像投稿機能(ActiveStorage)  
　-いいね機能(Ajax)  
　-ページネーション機能(kaminari)  
・カレンダー機能(fullcalendar)  

## 技術一覧
・Ruby 2.6.5  
・Rails 6.0.4.1  
・JavaScript  
・MySQL 5.6.51  
・Nginx  
・Unicorn  
・AWS

## DB設計
### users テーブル

| Column             | Type        | Options                |
| -------------------|-------------| -----------------------|
| email              | string      | null: false            |
| password           | string      | null: false            |
| nickname           | string      | null: false            |


### Association

- has_many :habits
- has_many :records
- has_many :likes

### habits テーブル

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

### records テーブル

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

### likes テーブル

| Column        | Type       | Options                        |
| --------------| -----------| -------------------------------|
| user_id       | references | null: false, foreign_key: true |
| record_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :record

## インフラ構成図

## 使い方

## 詳しい内容：Notion
URL
