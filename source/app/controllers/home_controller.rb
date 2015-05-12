class HomeController < ApplicationController

  def index
    @prints = Print.all
  end

end
