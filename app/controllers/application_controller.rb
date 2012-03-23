class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def authorize_admin!
    authenticate_user!
    redirect_to root_path, alert: "You must be an admin to do that." unless current_user.admin?
  end
  
  def authorize_renter!
    authenticate_user!
    redirect_to root_path, alert: "You must be a renter to do that." unless current_user.renter?
  end
end
