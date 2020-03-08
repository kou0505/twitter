class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name:'User' #存在しないfollowclassを探さすのを防ぐためclass_name:'user'をつける
end
