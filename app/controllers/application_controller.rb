require_dependency 'application_responder'
require_dependency 'ipaddr'

class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def self.responder
    ApplicationResponder
  end

  def guest_user?
    !current_user
  end

  def guest_user
    User.guest
  end



  protected

  def local_request?
    local_network = IPAddr.new('192.168.0.0/8')
    request.local? || local_network === request.remote_ip
  end

  def user_not_authorized(exception)
    flash[:error] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
