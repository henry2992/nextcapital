class Membership < ActiveRecord::Base

	has_many :leagues
	has_many :bowlers 

    validates_uniqueness_of :bowler_id, :scope => :league_id

end
