class ClansController < ApplicationController

  def index
    @clan = params['clanInput']
    
  end


  private
    def set_clan
      @clan = params['clanInput']
    end

    def clan_params
      params.fetch(:clan, {})
    end
end
