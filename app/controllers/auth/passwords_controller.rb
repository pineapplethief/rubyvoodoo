class Auth::PasswordsController < Devise::PasswordsController
  respond_to :html, :js

  # protected

  # def after_resetting_password_path_for(user)
  #   signed_in_root_path(user)
  # end

end
