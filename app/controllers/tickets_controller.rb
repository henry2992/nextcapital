class TicketsController < ApplicationController


	
  def buy
   
   @ticket = Ticket.new


   @bowler = Bowler.find(params[:ticket_id])

   @league = League.find(params[:league_id])

   @current_bowler = @bowler.id
   @current_jackpot = @league.id

   @ticket.bowler_id = @current_bowler
   @ticket.jackpot_id = @current_jackpot

   @ticket.save

   redirect_to league_path

  end
	 
end
