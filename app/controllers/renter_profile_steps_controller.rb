class RenterProfileStepsController < ApplicationController
  before_filter :authenticate_user!
  layout "renter_profile"
  include Wicked::Wizard
  steps :phones, :address_current, :income, :employment_1, :employment_2, :employment_3,
        :employment_explanation, :reference_1, :reference_2, :reference_3

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
