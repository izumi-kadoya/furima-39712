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
|Column            |Type    |Options                       |
|------------------|--------|------------------------------|
|nickname          |string  |null: false                   |
|email             |string  |null: false, unique: false    |
|encrypted_password|string  |null: false                   |
|lastname          |string  |null: false                   |
|firstname         |string  |null: false                   |
|lastname_kana     |string  |null: false                   |
|firstname_kana    |string  |null: false                   |
|birthday          |date    |null: false                   |

### Association
- has_many :items
- has_many :comments
- has_many :purchases


 ## itemsテーブル
|Column        |Type       |Options                        |
|--------------|-----------|-------------------------------|
|title         |string     |null: false                    |
|detail        |text       |null: false                    |
|category_id   |integer    |null: false                    |
|condition_id  |integer    |null: false                    |
|fee_id        |integer    |null: false                    |
|prefecture_id |integer    |null: false                    |
|duration_id   |integer    |null: false                    |
|price         |integer    |null: false                    |
|user          |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_one :purchase


 ## commentsテーブル
|Column    |Type       |Options                        |
|----------|-----------|-------------------------------|
|content   |text       |null: false                    |
|user      |references |null: false, foreign_key: true |
|item      |references |null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item


 ## purchasesテーブル
|Column    |Type       |Options                        |
|----------|-----------|-------------------------------|
|user      |references |null: false, foreign_key: true |
|item      |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address 


 ## addressesテーブル
|Column        |Type       |Options                        |
|--------------|-----------|-------------------------------|
|postcode      |string     |null: false                    |
|prefecture_id |integer    |null: false                    |
|city          |string     |null: false                    |
|street        |string     |null: false                    |
|building      |string     |                               |
|tel           |string     |null: false                    |
|purchase      |references |null: false, foreign_key: true |

### Association
- belongs_to :purchase