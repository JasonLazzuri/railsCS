class HomeController < ApplicationController

  def index
    @player = ['thing']
  end

  private
    def set_home
      @home = Home.find(params[:id])
    end

    def home_params
      params.fetch(:home, {})
    end
end
