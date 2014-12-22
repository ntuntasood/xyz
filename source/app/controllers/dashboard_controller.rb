class DashboardController < ApplicationController

  def index
  end

  def edit
    @c = current_user.creator
  end

end
