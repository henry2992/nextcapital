class Jackpot < ActiveRecord::Base
	
	# Associtions
	belongs_to :league
	has_many :tickets

	# Order Jackpots in League in Descendent Order
	def self.recent_jackpot
 	 	Jackpot.order(created_at: :desc)
	end

end
