class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
    @input = params['playerInput']
    @response = RestClient.get 'https://api.clashofclans.com/v1/players/%23'+ @input, {:Authorization => 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjU0NzI3MzRiLWEzOTMtNDFlNy05M2ZjLTJkYzE2YmMxMzc0MCIsImlhdCI6MTUwNzkyNDA3Niwic3ViIjoiZGV2ZWxvcGVyLzBmODMwMDgxLTAwZDUtYzdkMC1iODVjLTAxMWFmYzcyZmE2MSIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjI0LjE3LjE1LjE2OCJdLCJ0eXBlIjoiY2xpZW50In1dfQ.LJCzaGzmV8pmXdPk4jFEH_3SUUzSVKERnIHCxD8SArNpdtHg5qPEL526j_DluBEGE_WedPLF2g0LG8DmYD6aeg', :content_type => :json}

    @player = JSON.parse(@response)


    binding.pry
  end


  private
    def set_player
      @player = params['playerInput']
    end

    def player_params
      params.fetch(:player, {})
    end
end
