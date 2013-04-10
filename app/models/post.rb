class Post < ActiveRecord::Base
  attr_accessible :content, :name
  belongs_to :board, :counter_cache => true
  belongs_to :user
end
