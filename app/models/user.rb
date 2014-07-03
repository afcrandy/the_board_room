class User < ActiveRecord::Base
	before_save :lower_attrs
	before_create :create_remember_token

	has_many :reviews, foreign_key: "author_id"

	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
						uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 }
	VALID_UNAME_REGEX = /\A\w{4,18}\z/i
	validates :username, presence: true, length: 4..18, uniqueness: { case_sensitive: false },
						format: { with: VALID_UNAME_REGEX }, exclusion: { in: ["admin", "superuser"] }


	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end


	private

		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end

		def lower_attrs
			email.downcase!
			username.downcase!
		end
end
