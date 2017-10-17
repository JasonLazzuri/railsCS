class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
    @input = params['playerInput']
    @response = RestClient.get 'https://api.clashofclans.com/v1/players/%23'+ @input, {:Authorization => 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjFhMTYwY2Y1LTBmNDMtNDNkOS1iOWQ2LTgwYWQ5Y2RlYWYxNSIsImlhdCI6MTUwODE5MTkzOSwic3ViIjoiZGV2ZWxvcGVyLzBmODMwMDgxLTAwZDUtYzdkMC1iODVjLTAxMWFmYzcyZmE2MSIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjU0LjY5LjU3LjE5MCJdLCJ0eXBlIjoiY2xpZW50In1dfQ.Devza1EMm4hZnZbWQ3RGFwd-wjLrF04vQYzWMr75QkBelOOcVYBRxMklQxlkRp6VBjzNSyAICM0gUV_yBK8x1g', :content_type => :json}

    @player = JSON.parse(@response)

    image_array = ['BowlerFigure.png','DragonFigure.png','GiantFigure.png','HogRiderFigure.png','LavaHoundFigure.png','PEKKAFigure.png']

    @random = image_array[rand(0..5)]
    array = @player['clan']['tag']

    @clanTag = array[1..8]

  end


  private
    def set_player
      @player = params['playerInput']
    end

    def player_params
      params.fetch(:player, {})
    end
end
