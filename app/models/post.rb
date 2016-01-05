class Post < ActiveRecord::Base
	belongs_to :user
	has_many :tags , :through => :posttags
	has_many :posttags
	belongs_to :category
	has_many :comments
	
	
end
