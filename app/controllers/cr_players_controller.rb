class CrPlayersController < ApplicationController
  before_action :set_cr_player, only: [:show, :edit, :update, :destroy]

  # GET /cr_players
  # GET /cr_players.json
  def index
    @cr_players = CrPlayer.all
  end

  # GET /cr_players/1
  # GET /cr_players/1.json
  def show
  end

  # GET /cr_players/new
  def new
    @cr_player = CrPlayer.new
  end

  # GET /cr_players/1/edit
  def edit
  end

  # POST /cr_players
  # POST /cr_players.json
  def create
    @cr_player = CrPlayer.new(cr_player_params)

    respond_to do |format|
      if @cr_player.save
        format.html { redirect_to @cr_player, notice: 'Cr player was successfully created.' }
        format.json { render :show, status: :created, location: @cr_player }
      else
        format.html { render :new }
        format.json { render json: @cr_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cr_players/1
  # PATCH/PUT /cr_players/1.json
  def update
    respond_to do |format|
      if @cr_player.update(cr_player_params)
        format.html { redirect_to @cr_player, notice: 'Cr player was successfully updated.' }
        format.json { render :show, status: :ok, location: @cr_player }
      else
        format.html { render :edit }
        format.json { render json: @cr_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cr_players/1
  # DELETE /cr_players/1.json
  def destroy
    @cr_player.destroy
    respond_to do |format|
      format.html { redirect_to cr_players_url, notice: 'Cr player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cr_player
      @cr_player = CrPlayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cr_player_params
      params.fetch(:cr_player, {})
    end
end
