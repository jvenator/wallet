class SharedListings::PackagesController < ApplicationController

  def create
    package = Package.find(params[:id])
    @shared_listing = SharedListing.find(params[:shared_listing_id])
    @shared_listing.add_package(package)
    @packages = current_user.packages.where(["id NOT IN (?)", @shared_listing.package_ids]).order("name asc")
    render("refresh_package_selector", :status => :created)
  end

  def destroy
    @shared_listing = SharedListing.find(params[:shared_listing_id])
    @shared_listing.remove_package(Package.find(params[:id]))
    
    if !@shared_listing.package_ids.empty?
      @packages = current_user.packages.where(["id NOT IN (?)",
                    @shared_listing.package_ids]).order("name asc")
      else
      @packages = current_user.packages.order("name asc")
    end
    render("refresh_package_selector", :status => :ok)  
  end
  
  
end
