class DashboardsController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @documents = current_user.documents
    @packages = current_user.packages
    @shared_packages = current_user.shared_packages.where(:receiver_email => current_user.email)
    @listings = current_user.listings
    @shared_listings = current_user.shared_listings.where(:receiver_email => current_user.email)


    if current_user.admin?
      redirect_to admin_users_path
    elsif current_user.owner_rep?
      render "dashboard_owner_rep"
    else
      render "dashboard_renter"
    end
  end
end
      