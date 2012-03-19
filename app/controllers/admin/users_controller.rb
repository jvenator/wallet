class Admin::UsersController < Admin::BaseController
  
  def index
    @users = User.all(:order => "last_name")
  end
  
  def new
    @user = User.new
  end
end
