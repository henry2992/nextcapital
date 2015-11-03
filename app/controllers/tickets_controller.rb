class TicketsController < ApplicationController


	
	  def buy
	   
	   @ticket = Ticket.new


	   @bowler = Bowler.find(params[:ticket_id])

	   @league = League.find(params[:league_id])


	   @ticket.bowler_id = @bowler.id
	   @ticket.name = @bowler.name
	   @ticket.jackpot_id = @league.id


	   @ticket.save


	   @jackpot = Jackpot.find(params[:league_id])
	   
	   add_money_to_jackpot(@jackpot.id)

	   redirect_to league_path

	  end

  	def add_money_to_jackpot(id)
	    current_jackpot = Jackpot.find_by_id(id)
	    current_jackpot.balance += 10
	    current_jackpot.save
	end

	
	 
end
