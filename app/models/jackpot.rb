class Jackpot < ActiveRecord::Base
	belongs_to :league
	has_many :tickets

	def self.recent_jackpot
 	 	Jackpot.order(created_at: :desc)
	end

end
