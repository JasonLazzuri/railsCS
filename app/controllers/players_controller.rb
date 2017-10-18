class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index

    @input = params['playerInput']
    @response = RestClient.get 'https://api.clashofclans.com/v1/players/%23'+ @input, {:Authorization => 'Bearer ' + ENV["clashAPI"]  , :content_type => :json}

    @player = JSON.parse(@response)

    image_array = ['BowlerFigure.png','DragonFigure.png','GiantFigure.png','HogRiderFigure.png','LavaHoundFigure.png','PEKKAFigure.png']

    @random = image_array[rand(0..5)]

    if @player['tag'].length == 10
      array = @player['tag']
      @clanTag = array[1..9]
    elsif @player['tag'].length == 9
      array = @player['tag']
      @clanTag = array[1..8]
    end

  end


  private
    def set_player
      @player = params['playerInput']
    end

    def player_params
      params.fetch(:player, {})
    end
end
