class SharedListings::PackagesController < ApplicationController

  def create
    package = Package.find(params[:id])
    @shared_listing = SharedListing.find(params[:shared_listing_id])
    @listing = @shared_listing.listing
    @listing.submit_package(package)
    @packages = current_user.packages.where(["id NOT IN (?)", @listing.package_ids]).order("name asc")
    render("refresh_package_selector", :status => :created)
  end

  def destroy
    @shared_listing = SharedListing.find(params[:shared_listing_id])
    @listing = @shared_listing.listing
    @listing.unsubmit_package(Package.find(params[:id]))
    
    if @listing.package_ids.present?
      @packages = current_user.packages.where(["id NOT IN (?)",
                    @listing.package_ids]).order("name asc")
      else
      @packages = current_user.packages.order("name asc")
    end
    render("refresh_package_selector", :status => :ok)  
  end
  
  
end
