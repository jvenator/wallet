class SharedListingsController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @shared_listing = SharedListing.find(params[:id])
  end
end