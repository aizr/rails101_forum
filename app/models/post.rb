class Post < ActiveRecord::Base
  attr_accessible :content, :name
  belongs_to :board
  belongs_to :user
end
