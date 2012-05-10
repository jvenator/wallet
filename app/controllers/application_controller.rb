class ApplicationController < ActionController::Base
  protect_from_forgery

  #rescue_from CanCan::AccessDenied do |exception|
  #  redirect_to root_url, :alert => exception.message
  #end
  
  private
  
  def authorize_admin!
    authenticate_user!
    redirect_to root_path, alert: "You must be an admin to do that." unless current_user.admin?
  end
end
