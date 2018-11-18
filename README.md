## users_table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique:true|
|email|string|null: false|
|password|string|null: false|
|password_confirmation|string|null: false|


### Association
- has_many :contents
- has_many :comments


## contents_table
|Column|Type|Options|
|------|----|-------|
|title|text|null: false, index: true|
|summary|text| |
|text|text| |
|image|text| |
|user_id|references| |


### Association
- belongs_to :user
- has_many :comments



## comments_table
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key:true|
|contents_id|references|foreign_key:true|
|text|text| |

### Association
- belongs_to :user
- belongs_to :content

