class Post < ActiveRecord::Base
	#validates_presence_of :category_id


	belongs_to :user
	has_many :tags , :through => :posttags
	has_many :posttags
	belongs_to :category
	has_many :comments

	has_permalink :title
	def to_param
		permalink
	end
	
	
end
