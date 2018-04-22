class AccountsController < ApplicationController

  def index

  end

  def show
      if current_user.nil?
        flash[:notice] = 'You need to login first!'
        redirect_to new_user_session_path
      elsif current_user.id != params[:id].to_i
        flash[:notice] = 'You do not have access to this page!'
        redirect_to account_path(current_user.id)
      else
        account_path(current_user.id)
      end
  end

  private
    def set_home
      @home = Home.find(params[:id])
    end

    def home_params
      params.fetch(:home, {})
    end
end
