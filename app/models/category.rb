class Category < ActiveRecord::Base
	belongs_to :user
	has_many :posts , dependent: :destroy
	has_many :tags 
	has_many :posttags 
	has_many :comments
	
	has_permalink :title
	def to_param
		permalink
	end
end
