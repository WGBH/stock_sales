class UsersController < ApplicationController
  layout "user_profile"  

  before_filter :authenticate_user!
  before_filter :set_body_class

  def show
    @user = current_user
  end

  def set_body_class
    @body_class = 'dashboard'
  end
end
