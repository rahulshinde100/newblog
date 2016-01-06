class Comment < ActiveRecord::Base

	belongs_to :user 
	  belongs_to :post

	  has_permalink :comment_string

	  def to_param

	  	permalink
	  	
	  end
end
