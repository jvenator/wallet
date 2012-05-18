class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :choose_layout
  #rescue_from CanCan::AccessDenied do |exception|
  #  redirect_to root_url, :alert => exception.message
  #end
  
  private
  
  def authorize_admin!
    authenticate_user!
    redirect_to root_path, alert: "You must be an admin to do that." unless current_user.admin?
  end

  def choose_layout
  	if current_user
      if !current_user.renter?
    		'application'
    	else
    		'renter'
    	end
    else
      'application'
    end
  end
  		


end
