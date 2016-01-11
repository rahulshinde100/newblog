class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" } , default_url: "/images/medium/missing.png"
validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :tags , dependent: :destroy
  has_many :posts , dependent: :destroy
  has_many :categories , dependent: :destroy
  has_many :comments , dependent: :destroy

  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable , :confirmable, :lockable, :timeoutable
end
