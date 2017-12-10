class User < ApplicationRecord
	before_save { email.downcase! }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 200 },format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }, allow_blank: true
	has_secure_password

	belongs_to :hospital

	def User.digest(string)
	    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
	    BCrypt::Password.create(string, cost: cost)
	end
end
