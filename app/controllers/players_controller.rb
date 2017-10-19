class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index

    @input = params['playerInput']

    if params['playerInput'][0] == '#'
      @input = params['playerInput'][1..8]
    end

    @response = RestClient.get 'https://api.clashofclans.com/v1/players/%23'+ @input, {:Authorization => 'Bearer ' + ENV["clashAPI"]  , :content_type => :json}{ |response, request, result, &block|
      case response.code
      when 200
        @response = response
      when 404
        redirect_to root_path, notice: 'Not a valid player tag, try again'
        return
      end
    }

    @player = JSON.parse(@response)

    image_array = ['BowlerFigure.png','DragonFigure.png','GiantFigure.png','HogRiderFigure.png','LavaHoundFigure.png','PEKKAFigure.png']

    @random = image_array[rand(0..5)]

    if @player['clan'].nil?

    elsif@player['clan']['tag'].length == 10
      array = @player['clan']['tag']
      @clanTag = array[1..9]
    elsif @player['clan']['tag'].length == 9
      array = @player['clan']['tag']
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
