class Ticket < ActiveRecord::Base
	belongs_to :league
	belongs_to :jackpot
	belongs_to :bowler

	def self.pick_winner(id)
	   current_jackpot = Jackpot.find_by_id(id)	

	   tickets = Ticket.where(jackpot_id: current_jackpot).where(status: false)

	   new_balance = current_jackpot.balance
	   
	   if tickets.present? 

	   		winning_ticket = tickets.sample
		  	winning_ticket.status = true
		    winning_ticket.save

		   	strike = Random.new.rand(11)

		    if strike == 10
		   		current_jackpot.balance = 0
		   		tickets.where(status: false).destroy_all
		    else	
		   		current_jackpot.balance = current_jackpot.balance / 2
				tickets.where(status: false).destroy_all
		    end
	   
		   	current_jackpot.save

		   	return winning_ticket, strike, new_balance 
	   	
	   	else
	   		return nil
	    end
	   

	end
	 
end
