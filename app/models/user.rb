class User < ApplicationRecord
	VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
	VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/

	validates :name, 
	          presence: true,
	          length: { maximum: 15}

	validates :email,
	          presence: true,
	          format: {with: VALID_EMAIL_REGEX}

	validates :password, 
	          presence: true, 
	          length: { minimum: 8, maximum: 32 },
	          format: { with: VALID_PASSWORD_REGEX }


	 has_secure_password

	 has_many :topics
	 has_many :favorites
	 has_many :favorite_topics, through: :favorites, source: 'topic'
	 has_many :comments
end
