class MembershipsController < ApplicationController
  
  # Join a member in LEague
  def join
  	   # Create a new membership 
  	   @membership = Membership.new

  	   #Find bowler ID and League Id
	   @bowler = Bowler.find(params[:bowler_id])
	   @league = League.find(params[:league_id])

	   #Set the new Membership
	   @membership.bowler_id = @bowler.id
	   @membership.league_id = @league.id
	   @membership.name = @bowler.name
	   @membership.save

	   # Notify that bowler has joined.
	   flash[:notice] = [ @bowler.name ]
	   flash[:notice] << ["has joined League: "]
       flash[:notice] << @league.name

	   redirect_to @bowler
  end
end
