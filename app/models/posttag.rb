class Posttag < ActiveRecord::Base
	
	belongs_to :tag
	belongs_to :post
	has_many :categories
	has_many :comments

end
