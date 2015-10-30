class Bowler < ActiveRecord::Base
  	belongs_to :league
	has_many :tickets
	

	def add_ticket(id)
		ticket = Ticket.find_by_id(id)
		current_bowler = Bowler.find_by_id(id)
	    ticket.bowler_id = current_bowler 
	    ticket.save
	end

end
