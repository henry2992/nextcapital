class League < ActiveRecord::Base
	
 	has_many :bowlers

 	has_many :jackpots


 # 	def add_ticket(id)
	# 	ticket = Ticket.find_by_id(id)
	# 	current_bowler = Bowler.find_by_id(id)
	#     ticket.bowler_id = current_bowler 
	#     ticket.save
	# end
	
end