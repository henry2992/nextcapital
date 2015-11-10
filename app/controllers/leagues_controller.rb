class LeaguesController < ApplicationController
  before_action :authenticate_user!  #Authenticate User before getting it
  before_action :set_league, only: [:show, :edit, :update, :destroy]

  # GET /leagues
  # GET /leagues.json
  def index
    @leagues = League.all
    @league = League.new #Create user in index
  end

  # GET /leagues/1
  # GET /leagues/1.json
  def show
    @league = League.find(params[:id]) #Find the League to show.

    @jackpot_league = @league.jackpots.first #Find the first jackpot related to the League

    @jackpots = @league.jackpots.recent_jackpot #Find all the Jackpots and order them

    @tickets = @league.tickets.recent_tickets #Find all the Tickets in League and Orden Them

    @members = @league.memberships #Find League Memberships
  end

  # GET /leagues/new
  def new
    @league = League.new
  end

  # GET /leagues/1/edit
  def edit
  end



  # POST /leagues
  # POST /leagues.json
  def create
    @league = League.new(league_params)
    
    respond_to do |format|
      if @league.save
        @jackpot = @league.jackpots.create(jackpot_params)
        format.html { redirect_to leagues_path, notice: 'League was successfully created.' }
        format.json { render :show, status: :created, location: @league }
      else
        format.html { redirect_to leagues_path, notice: 'League was not created.Please name your League first.' }
      end
    end
  end

  # PATCH/PUT /leagues/1
  # PATCH/PUT /leagues/1.json
  def update
    respond_to do |format|
      if @league.update(league_params)
        format.html { redirect_to leagues_path, notice: 'League was successfully updated.' }
        format.json { render :show, status: :ok, location: @league} 
      else
        format.html { redirect_to leagues_path, notice: 'League was not updated.Please name your League first.' }

      end
    end

  end

  # DELETE /leagues/1
  # DELETE /leagues/1.json
  def destroy
    @league.destroy
    respond_to do |format|
      format.html { redirect_to leagues_url, notice: 'League was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 

  # Function to Draw Winner
  def draw
    @league = League.find(params[:id]) #Current League

    @jackpot = Jackpot.find(params[:jackpot_id]) #Get Current Jackpot
    
    @winner = Ticket.pick_winner(@jackpot.id) #Get all the Tickets and Pick a Winner
    
    

    # If there is a Wiining ticket
    if @winner.present?
      @new_jackpot = Jackpot.new #Create a new Jackpot
      @new_jackpot.league_id = @league.id #The new Jackpot will belong to the League 
      @new_jackpot.balance = @winner[2] #Set balance to Old Balnce (Ticket Model)
      @new_jackpot.payout = @winner[3] #Set the Payout to the Winning_price (Ticket Model)
      @new_jackpot.save
    end

    # If there is a Winner Notify with a flash Message, if not notify that there are no Tickets in the jackpot. 
    if @winner.present?
      @win_bowler = bowler_winner(@winner[0].bowler_id)
      flash[:notice] = ["The winning Ticket id is: "]
      flash[:notice] << @winner[0].id
      flash[:notice] << ". The owner of the ticket is: "
      flash[:notice] << @win_bowler.name
      flash[:notice] << ". Strike:"
      flash[:notice] << @winner[1]
    else
      flash[:notice] = ["There is no tickets in the current Jackpot"]
    end

    redirect_to @league
  end

  # Get the Info from the Bowler who won. 
  def bowler_winner(id)
    win_bowler = Bowler.find_by_id(id) 
    return win_bowler
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_league
      @league = League.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def league_params
      params.require(:league).permit(:name, :content, :membership_id)
    end

end
