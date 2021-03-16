# テーブル設計

## usersテーブル

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

### imageをActiveStorageで管理(null: false)

### Association

- has_many :tweets
- has_many :tags
- has_many :comments
- has_many :likes
- has_many :items
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


## relationshipsテーブル(follow機能用)

| Column             | Type       | Option                                        |
| ------------------ | ---------- | --------------------------------------------- |
| user               | references | foreign_key: true, null: false                |
| follow             | references | foreign_key: { to_table: users }, null: false |

### Association

- belongs_to :user
- belongs_to :follow, class_name: 'User'


## tweetsテーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| text               | text       | null: false                    |
| user               | references | foreign_key: true, null: false |

### has_manyでimageをActiveStorage管理(null: false)

### Association

- belongs_to :user
- has_many   :comments
- has_many   :tags, through: :tag_tweet_relations
- has_many   :tag_tweet_relations
- has_many   :likes
- has_one    :item


## tagsテーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| tag_name           | string     | uniqueness: true               |
| user               | references | foreign_key: true, null: false |

### Association

- belongs_to :user
- has_many   :tweets, through: :tag_tweet_relations
- has_many   :tag_tweet_relations


## tag_tweet_relationsテーブル(中間テーブル)

| Column            | Type        | Option                          |
| ----------------- | ----------- | ------------------------------- |
| tweet             | references  | foreign_key: true, null: false  |
| tag               | references  | foreign_key: true, null: false  |

### Association

- belongs_to :tweet
- belongs_to :tag


## likesテーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| user               | references | foreign_key: true, null: false |
| tweet              | references | foreign_key: true, null: false |

### Association

- belongs_to :user
- belongs_to :tweet

## commentsテーブル

| Column            | Type        | Option                          |
| ----------------- | ----------- | ------------------------------- |
| comment           | string      | null: false                     |
| user              | references  | foreign_key: true, null: false  |
| tweet             | references  | foreign_key: true, null: false  |

### Association

- belongs_to :user
- belongs_to :tweet


## itemsテーブル(各道具はジャンルごとに作成する)

| Column            | Type        | Option                          |
| ----------------- | ----------- | ------------------------------- |
| gear(item_name)   | string      | null: false                     |
| user              | references  | foreign_key: true, null: false  |
| tweet             | references  | foreign_key: true, null: false  |

### 各ジャンルのテーブル名
- chairs, tables, tents, tarps, bed_mats, burners, bonfires, lanterns, rucksacks, sleep_bags, 
  outer_wears, inner_wears, pants, shoes, knifes, cookers, hat_caps, other_gears

### Association

- belongs_to :user
- belongs_to :tweet


### 各キャンプ道具のテーブルを作ってジャンルごと保存する


## 各キャンプ道具のテーブル(共通)

| Column            | Type        | Option                          |
| ----------------- | ----------- | ------------------------------- |
| gear              | string      | null:false                      |
| item              | references  | foreign_key: true, null: false  |

### has_oneでimageを管理(ActiveStorage)

### Association

- belongs_to :item


## camp_sitesテーブル

| Column            | Type        | Option                          |
| ----------------- | ----------- | ------------------------------- |
| site              | string      | null: false                     |
| prefecture_id     | integer     | null: false                     |
| address           | string      | null: false                     |
| site_tel          | string      | null: false                     |
| site_type_id      | integer     | null: false                     |

### Association

- has_many   :visited_sites
- belongs_to :prefecture


## visited_sitesテーブル

| Column            | Type        | Option                          |
| ----------------- | ----------- | ------------------------------- |
| camp_site         | references  | foreign_key: true, null: false  |
| user              | references  | foreign_key: true, null: false  |

### Association

- belongs_to :user
- belongs_to :camp_site
