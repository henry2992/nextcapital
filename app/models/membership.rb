class Membership < ActiveRecord::Base

	# Associations
	has_many :leagues
	has_many :bowlers 
	
	#Validations
    validates_uniqueness_of :bowler_id, :scope => :league_id # Validate Uniqueness of Bowler in a League, a Bowler can join to League only once

end
