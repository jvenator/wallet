class Share_Listings::PackagesController < ApplicationController
#  before_filter authenticate_user!
  def create
    @shared_listing = Listing.find(params[:listing_id])
    Package.where(["id IN (?)", params[:id]]).each do |d|
    #Looks for document records with the params ID
      @shared_listing.add_package(d)
    end
    @packages = current_user.packages.where(["id NOT IN (?)", @shared_listing.package_ids]).order("name asc")
    render("refresh_package_selector", :status => :created)
  end
  def destroy
    @shared_listing = Listing.find(params[:listing_id])
    @shared_listing.remove_package(Listing.find(params[:id]))
    
    if !@shared_listing.package_ids.empty?
      @packages = current_user.packages.where(["id NOT IN (?)",
                    @shared_listing.package_ids]).order("name asc")
      else
      @packages = current_user.packages.order("name asc")
    end
    render("refresh_package_selector", :status => :ok)  
  end
  
  
end
