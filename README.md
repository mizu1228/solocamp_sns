# Campary.

## アプリケーション概要

  キャンプ好きが日記のように使える。
  そんなSNSアプリを作成しました。
  どこのキャンプ場にいつ行ったかを記録できます。
  自分の持っている道具を登録することができます。

## アプリケーションURL

  http://35.74.215.158/

## テスト用アカウント

|   Username    | e-mail     | password |
| ------------- | ---------- | -------- |
| user1         | email@mail | 1234abcd |
| user2         | qmail@mail | 1234abcd |


## 利用方法

  - まずは必要事項を入力してログインします。
  - 記事を投稿します。
  - いいねやフォローができます。
  - 道具が登録できます。
  - キャンプ場を探すことができます。
  - 訪れたことのあるキャンプ場をチェックできます。
  - お気に入り登録ができます。


## このアプリのペルソナ

  ペルソナはキャンプ好きの20~30代男性です。
  一人や少数でキャンプを楽しむ大人のためのSNSを目指しています。
  キャンプの記録を残したい、同じ趣味を持つ友人と繋がりたい。
  そんなキャンプ好きのために開発をしました。


## 今後実装予定の機能

  - 他SNS（Twitter、Facebook等）への投稿機能
  - 投稿記事への道具紐付け機能




## テーブル設計

### usersテーブル

| Column             | Type    | Option                      |
| ------------------ | ------- | --------------------------- |
| name               | string  | null:   false               |
| email              | string  | unique: true, null: false   |
| encrypted_password | string  | null:   false               |
| phone_num          | string  | null:   false               |
| introduce          | text    |                             |
| camp_style_id      | integer |                             |
| trans_style_id     | integer |                             |
| season_id          | integer |                             |
| prefecture_id      | integer |                             |

#### imageをActiveStorageで管理(null: false)

#### Association

- has_many :tweets
- has_many :tags
- has_many :comments
- has_many :likes
- has_many :items
- has_many :interes
- -----以下ActiveHash-------
- belongs_to  :camp_style
- belongs_to  :trans_style
- belongs_to  :season
- belongs_to  :prefecture
- ------Followに関する記述-----
- has_many :relationships
- has_many :followings, through: :relationships, source: :follow
- has_many :reverse_of_relationships, class_name: 'Relationship',
            foreign_key: 'follow_id'
- has_many :followers, through: :reverse_of_relationships, source: :user


### relationshipsテーブル(follow機能用)

| Column             | Type       | Option                                        |
| ------------------ | ---------- | --------------------------------------------- |
| user               | references | foreign_key: true, null: false                |
| follow             | references | foreign_key: { to_table: users }, null: false |

#### Association

- belongs_to :user
- belongs_to :follow, class_name: 'User'


### tweetsテーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| text               | text       | null: false                    |
| user               | references | foreign_key: true, null: false |
| camp_site          | references | foreign_key: true              |

#### has_manyでimageをActiveStorage管理(null: false)

#### Association

- belongs_to :user
- belongs_to :camp_site
- has_many   :comments
- has_many   :tags, through: :tag_tweet_relations
- has_many   :tag_tweet_relations
- has_many   :likes
- has_one    :item


### tagsテーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| tag_name           | string     | uniqueness: true               |
| user               | references | foreign_key: true, null: false |

#### Association

- belongs_to :user
- has_many   :tweets, through: :tag_tweet_relations
- has_many   :tag_tweet_relations


### tag_tweet_relationsテーブル(中間テーブル)

| Column            | Type        | Option                          |
| ----------------- | ----------- | ------------------------------- |
| tweet             | references  | foreign_key: true, null: false  |
| tag               | references  | foreign_key: true, null: false  |

#### Association

- belongs_to :tweet
- belongs_to :tag


### likesテーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| user               | references | foreign_key: true, null: false |
| tweet              | references | foreign_key: true, null: false |

#### Association

- belongs_to :user
- belongs_to :tweet

### commentsテーブル

| Column            | Type        | Option                          |
| ----------------- | ----------- | ------------------------------- |
| comment           | string      | null: false                     |
| user              | references  | foreign_key: true, null: false  |
| tweet             | references  | foreign_key: true, null: false  |

#### Association

- belongs_to :user
- belongs_to :tweet


### gearsテーブル

| Column            | Type        | Option                            |
| ----------------- | ----------- | --------------------------------- |
| gear_name         | string      | null: false                       |
| explanation       | string      |                                   |
| user              | references  | foreign_key: true, null: false    |
| tweet             | references  | foreign_key: true                 |
| gear_genre_id     | integer     | null: false                       |
| image             |             | ActiveStorageで管理                |


#### Association

- belongs_to :user
- belongs_to :tweet, optional: true
- belongs_to :gear_genre (ActiveHash)



### camp_sitesテーブル

| Column            | Type        | Option                          |
| ----------------- | ----------- | ------------------------------- |
| site              | string      | null: false                     |
| prefecture_id     | integer     | null: false                     |
| address           | string      | null: false                     |
| site_tel          | string      | null: false                     |
| site_type_id      | integer     | null: false                     |

#### Association

- has_many   :visited_sites
- has_many   :tweets
- has_many   :interes
- belongs_to :prefecture


### visited_sitesテーブル

| Column            | Type        | Option                          |
| ----------------- | ----------- | ------------------------------- |
| camp_site         | references  | foreign_key: true, null: false  |
| user              | references  | foreign_key: true, null: false  |

#### Association

- belongs_to :user
- belongs_to :camp_site


### intereテーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| user               | references | foreign_key: true, null: false |
| camp_site          | references | foreign_key: true, null: false |

#### Association

- belongs_to :user
- belongs_to :camp_site
