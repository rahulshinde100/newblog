class Tag < ActiveRecord::Base
	belongs_to :user
	has_many :posts , :through => :posttags
	has_many :posttags
	has_many :categories
	has_many :comments
end
