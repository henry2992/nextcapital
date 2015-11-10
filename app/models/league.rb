class League < ActiveRecord::Base
	
	# Validations
	validates :name, presence: true

	# Associations
	has_many :memberships 
 	has_many :bowlers, :through => :memberships
 	has_many :jackpots
 	has_many :tickets

end
