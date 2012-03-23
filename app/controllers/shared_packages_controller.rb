class SharedPackagesController < ApplicationController
  before_filter :authorize_renter!
  
  def show
    @shared_package = SharedPackage.find(params[:id])
  end
end