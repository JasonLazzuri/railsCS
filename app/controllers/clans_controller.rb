class ClansController < ApplicationController

  def index

    if params['clanInput'].nil?
        @input = params['playerInput']
        @response = RestClient.get 'https://api.clashofclans.com/v1/player/%23'+ @input, {:Authorization => 'Bearer '+ ENV["clashAPI"], :content_type => :json}
      else
        @input = params['clanInput']
        @response = RestClient.get 'https://api.clashofclans.com/v1/clans/%23'+ @input +'/members', {:Authorization => 'Bearer ' + ENV["clashAPI"], :content_type => :json}

        @url = RestClient.get 'https://api.clashofclans.com/v1/clans/%23'+ @input, {:Authorization => 'Bearer ' + ENV["clashAPI"], :content_type => :json}

        @tag = JSON.parse(@url)
        @clan = JSON.parse(@response)
    end
  end

  private
    def set_clan
      @clan = params['clanInput']
    end

    def clan_params
      params.fetch(:clan, {})
    end
end
