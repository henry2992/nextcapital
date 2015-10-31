class League < ActiveRecord::Base
	
 	has_many :bowlers

 	has_many :jackpots

 	has_many :tickets




end
