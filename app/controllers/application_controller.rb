class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
    flash[:alert] = "You must be an admin to do that."
    redirect_to root_path
    end
  end
  
  def authorize_renter!
    authenticate_user!
    unless current_user.renter?
    flash[:alert] = "You must be a renter to do that."
    redirect_to root_path
    end
  end
end
