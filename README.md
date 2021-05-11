

## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |

| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| position   | text   | null: false |
| occupation | text   | null: false |

## protoptypes  テーブル

| Column       | Type             | Options          |
| ------       | ------           | -----------      |

| title        | string           | null: false      |
| catch_copy   | text             | null: false      |
| concept      | text             | null: false      |
| image        |                  |                  |
| user         | references       |                  |


## comments  テーブル

| Column        | Type       | 
| Options         |  
| ------        | ---------- | ------------------|

| text          | text       | null: false 
                  |
| user          | references | null: false, foreign_key: true |
| protoptypes   | references | null: false, foreign_key: true |

