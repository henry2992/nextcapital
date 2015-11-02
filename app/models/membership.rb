class Membership < ActiveRecord::Base

	has_many :leagues
	has_many :bowlers 

	validates_uniqueness_of :bowler_id, :message => "can be only be joined once", :scope => 'bowler_id'


end
