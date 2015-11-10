class Auth::RegistrationsController < Devise::RegistrationsController
  respond_to :html, :js

  # def create
  #   super do |user|
  #     # Custom create logic goes here
  #   end
  # end

  def sign_up_params
    params.permit(:email,
                  :password,
                  :password_confirmation)
  end

  def account_update_params
    params.permit(:email,
                  :password,
                  :password_confirmation,
                  :current_password)
  end

end
