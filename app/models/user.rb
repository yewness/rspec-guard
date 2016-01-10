class User < ActiveRecord::Base
	after_create :generate_referral_code
	
	validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	has_many :referrals

	def self.first
		return self.last
	end

	def generate_referral_code
		self.update(referral_code: SecureRandom.base64[0..8])
	end

    def add_referral(referral)
		byebug
	end
end
