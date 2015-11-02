class MembershipsController < ApplicationController
  def join


  	   @membership = Membership.new


	   @bowler = Bowler.find(params[:bowler_id])

	   @league = League.find(params[:league_id])



	   @membership.bowler_id = @bowler.id
	   @membership.league_id = @league.id
	   @membership.name = @bowler.name
	   
	   @membership.save


	   redirect_to @league
  end
end
