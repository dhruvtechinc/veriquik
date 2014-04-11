class VerificationOrder < ActiveRecord::Base
	belongs_to :user
	belongs_to :customer
	STATUS = %w[new in_progress complete]
end
