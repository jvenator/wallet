class RenterProfilesController < ApplicationController

  def show
    @renter_profile = current_user.renter_profiles.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @renter_profile }
    end
  end
  
  def new
    @renter_profile = RenterProfile.new
    render new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @renter_profile }
    end
  end
  
  def edit
    @renter_profile = current_user.renter_profiles.find(params[:id])
  end

  def create
    @renter_profile = current_user.renter_profiles.build(params[:renter_profile])
          
    respond_to do |format|
      if @renter_profile.save
        format.html { redirect_to dashboard_path(@renter_profile), notice: 'Your profile was saved!' }
        format.json { render json: renter_profile_path(@renter_profile), status: :created, location: @renter_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @renter_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @renter_profile = current_user.renter_profiles.find(params[:id])
    
    respond_to do |format|
      if @renter_profile.update_attributes(params[:renter_profile])
        format.html { redirect_to dashboard_path, notice: 'Your profile was saved!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @renter_profile.errors, status: :unprocessable_entity }
      end
    end
  end
  


end