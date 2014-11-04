class RegistrationsController < Devise::RegistrationsController

  def update_resource(resource, params)
    if resource.password != params[:password] ||
      resource.email != params[:email] 
      resource.update_with_password(params)
    else
      resource.update_without_password(params)
    end
  end
end
