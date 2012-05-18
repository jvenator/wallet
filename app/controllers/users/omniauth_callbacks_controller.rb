class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_filter :authenticate_user!, :only => [:dwolla, :dropbox]

  def facebook
    # Used for login
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
     # Not using for login authentication, only for getting auth token & persisting that
     current_user.add_dwolla(request.env["omniauth.auth"])

     if current_user.dwolla_user
       flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Dwolla"
       redirect_to root_path
     else
       redirect_to account_path
       flash[:error] = "An Error occured. Please try again"
     end
  end

  def dropbox
     # Not using for login authentication, only for auth token persistence
     # Request coming back from dropbox?
    current_user.add_dropbox(request.env["omniauth.auth"])

    if current_user.dropbox_user
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Dropbox"
      redirect_to account_path
    else
      redirect_to account_path
      flash[:error] = "An Error occured. Please try again"
    end
  end
end