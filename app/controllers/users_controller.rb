class UsersController < ApplicationController

  def show
    @c = Creator.find_by(name: params[:user], active: true)
    if not @c
      flash[:alert] = "creator #{params[:user]} unavailable"
      redirect_to controller: 'home', action: 'index'
    end
  end

end
