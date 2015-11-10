class BowlersController < ApplicationController

  before_action :set_bowler, only: [:show, :edit, :update, :destroy]
  

  # GET /bowlers
  # GET /bowlers.json
  def index
    @bowlers = Bowler.all
    @bowler = Bowler.new
  end

  # GET /bowlers/1
  # GET /bowlers/1.json
  def show
    @leagues = League.all
  end

  # GET /bowlers/new
  def new
    @bowler = Bowler.new
  end

  # GET /bowlers/1/edit
  def edit
  end

  # POST /bowlers
  # POST /bowlers.json
  def create
    @bowler = Bowler.new(bowler_params)

    respond_to do |format|
      if @bowler.save
        format.html { redirect_to bowlers_path, notice: 'Bowler was successfully created.' }
        format.json { render :show, status: :created, location: @bowler }
      else
        format.html { redirect_to bowlers_path, notice: 'Bowler was not created. You need to name your bowler.' }
      end
    end
  end

  # PATCH/PUT /bowlers/1
  # PATCH/PUT /bowlers/1.json
  def update
    respond_to do |format|
      if @bowler.update(bowler_params)
        format.html { redirect_to bowlers_path, notice: 'Bowler was successfully updated.' }
        format.json { render :show, status: :ok, location: @bowler }
      else
        format.html { redirect_to bowlers_path, notice: 'Bowler was not updated. You need to name your bowler.' }
      end
    end
  end

  # DELETE /bowlers/1
  # DELETE /bowlers/1.json
  def destroy
    @bowler.destroy
    respond_to do |format|
      format.html { redirect_to bowlers_url, notice: 'Bowler was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bowler
      @bowler = Bowler.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bowler_params
      params.require(:bowler).permit(:name, :league_id)
    end
end
