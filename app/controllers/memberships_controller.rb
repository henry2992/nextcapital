class MembershipsController < ApplicationController
 

  def new
      @league = League.find params[:league_id]
      @membership = Membership.new
    end

    def create
      @league = League.find params[:league_id]
      @membership = Membership.new(membership_params)
    end

    private

    def membership_params
        params.require(:membership).merge(league_id: params[:league_id], bowler_id: bowler.id)
    end

end
