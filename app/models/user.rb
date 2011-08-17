class User < ActiveRecord::Base

	acts_as_authentic # call on authlogic

	has_many :phenotypes
	has_many :genotypes
	has_many :user_snps


	def deliver_password_reset_instructions!
		reset_perishable_token!
		Notifier.deliver_password_reset_instructions(self)
	end
end
