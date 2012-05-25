class RenterProfileStepsController < ApplicationController
  before_filter :authenticate_user!
  layout "renter_profile"
  include Wicked::Wizard
  steps :address, :personal

  def show
    @renter_profile = current_user.renter_profile ||= RenterProfile.new
    render_wizard
  end
  
  def update
    @renter_profile = current_user.renter_profile
    @renter_profile.update_attributes(params[:renter_profile])
    render_wizard @renter_profile
  end

private

  def redirect_to_finish_wizard
    redirect_to root_url, notice: "Thanks for completing your renter profile!"
  end
end
