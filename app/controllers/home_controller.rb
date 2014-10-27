class HomeController < ApplicationController

  def home
    @users = User.all
  end
end
