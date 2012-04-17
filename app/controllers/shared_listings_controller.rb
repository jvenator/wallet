class SharedListingsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @shared_listing = current_user.shared_listings.find(params[:id])
    @listing_user = @shared_listing.listing.user
    @documents = @shared_listing.listing.documents
    if @shared_listing.packages.exists?
      @packages = current_user.packages.where(["id NOT IN (?)", @shared_listing.package_ids]).order("name asc")
    else
      @packages = current_user.packages
    end
  end
end