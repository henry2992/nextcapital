class Ticket < ActiveRecord::Base

	# Associations
	belongs_to :league
	belongs_to :jackpot
	belongs_to :bowler

	# Pick Winner of Jackpot

	def self.pick_winner(id)
	   current_jackpot = Jackpot.find_by_id(id)	#Find Current Jacpot

	   # If Ticket Status = False, it means that is not a winner tickets. 
	   tickets = Ticket.where(jackpot_id: current_jackpot).where(status: false) #Find Non-winning Tickets in jackpot 

	   # Set the current balance to be the old balance.
	   old_balance = current_jackpot.balance
	   
	   # Check if Jackpot has Tickets
	   if tickets.present? 

	   		# If there are tickers Pick one add random
	   		winning_ticket = tickets.sample
	   		# Set it to true (Winning Ticket)
		  	winning_ticket.status = true
		    winning_ticket.save

		    # Get a random Strike between o and 10
		   	strike = Random.new.rand(11)

		   	# If Strike is equal to 10
		    if strike == 10
		    	# Winning Price is total
		    	winning_price = old_balance
		    	# Balance goes to 0
		   		current_jackpot.balance = 0
		   		# Destroy all the tickets with False stat
		   		tickets.where(status: false).destroy_all
		    else	
		   		# Balance goes to half 
		   		current_jackpot.balance = current_jackpot.balance / 2
				tickets.where(status: false).destroy_all
				winning_price = current_jackpot.balance
		    end
	   
	   		
	   		# Set winning ticket new information
	   		winning_ticket.price = winning_price
	   		winning_ticket.strike = strike 
	   		winning_ticket.save

	   		# Set the new Jackpot Information
		   	current_jackpot.save

		   	return winning_ticket, strike, old_balance, winning_price, strike 
	   	else
	   		# If there are no tickets do nothing
	   		return nil
	    end
	   

	end

	# Order Tickets in Descendent Order 
	def self.recent_tickets
 	 	Ticket.order(created_at: :desc)
	end
	 
end
