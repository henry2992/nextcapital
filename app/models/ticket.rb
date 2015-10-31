class Ticket < ActiveRecord::Base
	belongs_to :jackpot
	belongs_to :bowler


	 def self.add_bowler(ticket_id, bowler_id)
	    current_ticket = Ticket.find_by_id(ticket_id)
	    current_bowler = Bowler.find_by_id(bowler_id)

	    current_ticket.bowler_id = current_bowler.id
	    current_ticket.save
	 end
	 
end
