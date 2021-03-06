class ApplicationController < ActionController::Base
  # Adds a few additional behaviors into the application controller 
   include Blacklight::Controller
  # Please be sure to impelement current_user and user_session. Blacklight depends on 
  # these methods in order to perform user specific actions. 

  # Adds a few additional behaviors into the application controller 
   include Blacklight::Controller
  # Please be sure to implement current_user and user_session. Blacklight depends on 
  # these methods in order to perform user specific actions. 

  before_action :configure_permitted_parameters, if: :devise_controller?  

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    fields = [:first_name, :last_name, :email, :password, :password_confirmation, :current_password, 
      :remember_me, :company, :phone, :fax, :address1, :address2, :city, :state, :zipcode]

    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(*fields) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(*fields) } 
  end

end
