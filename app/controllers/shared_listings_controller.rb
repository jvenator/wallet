class SharedListingsController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @shared_listing = current_user.shared_listings.find(params[:id])
  end
end