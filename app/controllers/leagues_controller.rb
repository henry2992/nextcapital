class LeaguesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_league, only: [:show, :edit, :update, :destroy]

  # GET /leagues
  # GET /leagues.json
  def index
    @leagues = League.all

  end

  # GET /leagues/1
  # GET /leagues/1.json
  def show
    @league = League.find(params[:id])
    @members = @league.memberships
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
        # @membership = @league.memberships.create
        format.html { redirect_to @league, notice: 'League was successfully created.' }
        format.json { render :show, status: :created, location: @league }
      else
        format.html { render :new }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leagues/1
  # PATCH/PUT /leagues/1.json
  def update
    respond_to do |format|
      if @league.update(league_params)
        format.html { redirect_to @league, notice: 'League was successfully updated.' }
        format.json { render :show, status: :ok, location: @league }
      else
        format.html { render :edit }
        format.json { render json: @league.errors, status: :unprocessable_entity }
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
 

  def draw
    @league = League.find(params[:id])

    @jackpot = Jackpot.find(params[:jackpot_id])
    

    @winner = Ticket.pick_winner(@jackpot.id)
    

    

    if @winner.present?
      @win_bowler = bowler_winner(@winner[0].bowler_id)
      flash[:notice] = ["The winning tikcet id is: "]
      flash[:notice] << @winner[0].id
      flash[:notice] << "The owner of the ticket is: "
      flash[:notice] << @winner[0].bowler_id
      flash[:notice] << @win_bowler.name
      flash[:notice] << "Strike:"
      flash[:notice] << @winner[1]
    else
      flash[:notice] = ["There is no tickets in the current Jackpot"]
    end

    if @winner.present?
      @new_jackpot = Jackpot.new
      @new_jackpot.league_id = @league.id
      @new_jackpot.balance = @winner[2]
      @new_jackpot.save
    end

    redirect_to @league
  end

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

    

    def jackpot_params
      params.require(:league).permit(:balance)
    end

end
