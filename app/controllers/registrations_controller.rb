class RegistrationsController < Devise::RegistrationsController
  def update
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)

    # required for settings form to submit when password is left blank
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end

    @user = User.find(current_user.id)

    successfully_updated = if needs_password?(@user, params)
      @user.update_with_password(account_update_params)
    else
      # remove the virtual current_password attribute update_without_password
      # doesn't know how to ignore it
      account_update_params.delete("current_password")
      @user.update_without_password(account_update_params)
    end
  
    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, bypass: true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

  private

  # check if we need password to update user data
  # ie if password or email was changed, extend this as needed
  def needs_password?(user, params)
    user.email != params[:user][:email] || params[:user][:password].present?
  end
end
