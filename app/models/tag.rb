class Tag < ActiveRecord::Base

	has_permalink :tag_title
	belongs_to :user
	has_many :posts , :through => :posttags , dependent: :destroy
	has_many :posttags , dependent: :destroy
	has_many :categories
	has_many :comments

	def to_param
		permalink
	end
end
