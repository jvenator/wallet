class SharedPackagesController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @shared_package = SharedPackage.find(params[:id])
  end
end