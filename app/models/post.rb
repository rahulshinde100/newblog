class Post < ActiveRecord::Base
	#validates_presence_of :category_id
has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" } , default_url: "/images/medium/missing.png"

	 validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	belongs_to :user
	has_many :tags , :through => :posttags
	has_many :posttags , dependent: :destroy
	belongs_to :category
	has_many :comments , dependent: :destroy

	has_permalink :title
	def to_param
		permalink
	end
	
	
end
