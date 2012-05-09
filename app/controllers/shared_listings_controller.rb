class SharedListingsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @shared_listing = current_user.shared_listings.find(params[:id])
    @listing = @shared_listing.listing
    @listing_user = @shared_listing.listing.user
    @documents = @shared_listing.listing.documents
    if @listing.packages.exists?
      @packages = current_user.packages.where(["id NOT IN (?)", @listing.package_ids]).order("name asc")
    else
      @packages = current_user.packages
    end
  end
end