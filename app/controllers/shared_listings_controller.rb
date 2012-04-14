class SharedListingsController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @shared_listing = current_user.shared_listings.find(params[:id])
    @packages = current_user.packages-shared_listing.packages
    # if you replace the above line with \\@packages = current_user.packages// it tells you
    # that a route is missing even though it shows up in rake routes
  end
end