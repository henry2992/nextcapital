class TicketsController < ApplicationController


	  # Buy A Ticket
	  def buy
	   
	   # Create a New Ticket
	   @ticket = Ticket.new
	   # Find League, Bowler, and Jackpot ID
	   @bowler = Bowler.find(params[:ticket_id])
	   @league = League.find(params[:league_id])
	   @jackpot = Jackpot.find(params[:jackpot_id])

	   # Set the New Ticket Information
	   @ticket.bowler_id = @bowler.id
	   @ticket.name = @bowler.name
	   @ticket.jackpot_id = @jackpot.id
	   @ticket.league_id = @league.id
	   @ticket.save

	   # Add the Price of the Ticket to the JAcpot
	   add_money_to_jackpot(@jackpot.id)

	   redirect_to league_path
	  end

	  # Add Money to Jackpot
	  def add_money_to_jackpot(id)
		current_jackpot = Jackpot.find_by_id(id)
		current_jackpot.balance += 10
		current_jackpot.save
	 end

	
	 
end
