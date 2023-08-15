# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Database instrustions
 ## usersテーブル
|Column        |Type    |Options       |
|--------------|--------|--------------|
|nickname      |string  |null: false   |
|email         |string  |unique: false |
|password      |string  |null: false   |
|password_c    |string  |null: false   |
|lastname      |string  |null: false   |
|firstname     |string  |null: false   |
|lastname_kana |string  |null: false   |
|firstname_kana|string  |null: false   |
|birthday      |date    |null: false   |

### Association
- has_many :items
- has_many :comments
- has_many :purchases


 ## itemsテーブル
|Column        |Type       |Options                        |
|--------------|-----------|-------------------------------|
|title         |string     |null: false                    |
|detail        |text       |null: false                    |
|category      |string     |null: false                    |
|condition     |string     |null: false                    |
|fee           |string     |null: false                    |
|area          |string     |null: false                    |
|day           |date       |null: false                    |
|price         |integer    |null: false                    |
|user_id       |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_one :purchase


 ## commentsテーブル
|Column    |Type       |Options                        |
|----------|-----------|-------------------------------|
|content   |text       |null: false                    |
|user_id   |references |null: false, foreign_key: true |
|item_id   |references |null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item


 ## purchasesテーブル
|Column    |Type       |Options                        |
|----------|-----------|-------------------------------|
|user_id   |references |null: false, foreign_key: true |
|item_id   |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address 


 ## addressesテーブル
|Column     |Type       |Options                        |
|-----------|-----------|-------------------------------|
|postcode   |string     |null: false                    |
|prefecture |string     |null: false                    |
|city       |string     |null: false                    |
|street     |string     |null: false                    |
|building   |string     |null: false                    |
|tel        |integer    |null: false                    |
|purchase_id|references |null: false, foreign_key: true |

### Association
- belongs_to :purchase