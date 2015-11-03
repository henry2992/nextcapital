class League < ActiveRecord::Base
	
	has_many :memberships 
 	has_many :bowlers, :through => :memberships



 	has_many :jackpots

 	has_many :tickets


end
