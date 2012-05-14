class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def dwolla
     @user = User.find_for_dwolla_oauth(request.env["omniauth.auth"], current_user)

     if @user.persisted?
       flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Dwolla"
       #Todo need to redirect user to a form and get a valid email address as dwolla doesn't provide one
       sign_in_and_redirect @user, :event => :authentication
     else
       redirect_to new_user_registration_url
     end
  end
end