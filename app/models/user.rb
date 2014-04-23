class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,  :confirmable
  before_save :ensure_authentication_token

  has_many :verification_orders

  ROLES = %w[admin user b2b]
  before_save { self.email = email.downcase }
	#before_create :create_remember_token

	def skip_confirmation!
		self.confirmed_at = Time.now
	end
	def ensure_authentication_token
		puts "1111111111111111111111111111"
		if authentication_token.blank?
			puts "222222222222222222222222222222222222"
			self.authentication_token = generate_authentication_token
		end
	end

	private
	def generate_authentication_token
		loop do
			token = Devise.friendly_token
			break token unless User.where(authentication_token: token).first
		end
	end

end
