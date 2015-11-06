class Ticket < ActiveRecord::Base
	belongs_to :league
	belongs_to :jackpot
	belongs_to :bowler

	def self.pick_winner(id)
	   current_jackpot = Jackpot.find_by_id(id)	

	   tickets = Ticket.where(jackpot_id: current_jackpot).where(status: false)

	   old_balance = current_jackpot.balance
	   
	   if tickets.present? 

	   		winning_ticket = tickets.sample
		  	winning_ticket.status = true
		    winning_ticket.save

		   	strike = Random.new.rand(11)

		    if strike == 10
		    	new_balance = old_balance
		   		current_jackpot.balance = 0
		   		tickets.where(status: false).destroy_all
		    else	
		   		current_jackpot.balance = current_jackpot.balance / 2
				tickets.where(status: false).destroy_all
				new_balance = current_jackpot.balance
		    end
	   
	   		
	   		
	   		winning_ticket.price = new_balance
	   		winning_ticket.strike = strike 
	   		winning_ticket.save


		   	current_jackpot.save

		   	return winning_ticket, strike, old_balance, new_balance, strike 
	   	
	   	else
	   		return nil
	    end
	   

	end

	def self.recent_tickets
 	 	Ticket.order(created_at: :desc)
	end
	 
end
