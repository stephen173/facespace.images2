class User
	include Mongoid::Document
	include ActiveModel::SecurePassword
	include Mongoid::Paperclip

  
    has_mongoid_attached_file :image
	validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]

	has_many :wallposts

	has_and_belongs_to_many :friends, class_name: "User", inverse_of: nil	  
  #many-many self-referential.  will it work!?!

	field :email, type: String
	field :name, type: String
	field :profile_pic_url, type: String
	field :bio, type: String

	field :password_digest, type: String

	validate :email, presence: true, uniqueness: true

	has_secure_password
end

