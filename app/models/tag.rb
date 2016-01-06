class Tag < ActiveRecord::Base

	has_permalink :tag_title
	belongs_to :user
	has_many :posts , :through => :posttags
	has_many :posttags
	has_many :categories
	has_many :comments

	def to_param
		permalink
	end
end
