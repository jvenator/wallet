class DashboardsController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @documents = current_user.documents
    @packages = current_user.packages
    @shared_packages = current_user.shared_packages
    
    if current_user.renter?
      render "dashboard_renter"
    elsif current_user.manager?
      render "dashboard_manager"
    else
      render "dashboard_admin"
    end
  end
end
      