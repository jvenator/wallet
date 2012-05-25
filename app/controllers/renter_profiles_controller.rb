class RenterProfilesController < ApplicationController
  before_filter :authenticate_user!
  layout :renter_profile

  def index
    redirect_to root_path
  end
  
  def show
    @renter_profile = RenterProfile.find(params[:id])
  end
  
  def new
    @renter_profile = RenterProfile.new
  end
  
  def edit
    @renter_profile = current_user.renter_profile
  end

  def create
    @renter_profile = RenterProfile.create(params[:renter_profile])
    if @renter_profile.save
      redirect_to renter_profile_steps_path, notice: 'Basic contact info saved!'
    else
      render action: "new"
    end
  end

  def update
    @renter_profile = current_user.renter_profile

    if @renter_profile.update_attributes(params[:renter_profile])
      redirect_to renter_profile_steps_path, notice: 'Your profile was saved!'
    else
      render action: "edit"
    end
  end
  
end