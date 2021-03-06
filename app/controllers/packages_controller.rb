class PackagesController < ApplicationController
  before_filter :authenticate_user!

  # GET /packages
  # GET /packages.json
  def index
    @packages = current_user.packages
    @shared_packages = current_user.shared_packages

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @packages }
    end
  end

  # GET /packages/1
  # GET /packages/1.json
  def show
    @package = current_user.packages.find(params[:id])
    @documents = current_user.documents-@package.documents

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @package }
    end
  end

  # GET /packages/new
  # GET /packages/new.json
  def new
    @package = Package.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @package }
    end
  end

  # GET /packages/1/edit
  def edit
    @package = current_user.packages.find(params[:id])
  end

  # POST /packages
  # POST /packages.json
  def create
    @package = current_user.packages.build(params[:package])

    respond_to do |format|
      if @package.save
        format.html { redirect_to @package, notice: 'Package was successfully created.' }
        format.json { render json: @package, status: :created, location: @package }
      else
        format.html { render action: "new" }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /packages/1
  # PUT /packages/1.json
  def update
    @package = current_user.packages.find(params[:id])

    respond_to do |format|
      if @package.update_attributes(params[:package])
        format.html { redirect_to @package, notice: 'Package was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packages/1
  # DELETE /packages/1.json
  def destroy
    @package = current_user.packages.find(params[:id])
    @package.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end
  
  def share
    package = current_user.packages.find(params[:id])
    target = params[:email].downcase
    shared_package = package.share_by_email(current_user, target)
    
    if shared_package.persisted?
      flash[:notice] = "Package shared successfully"
    else
      flash[:notice] = shared_package.errors.full_messages.first
    end
    
    redirect_to package_path(package)
  end
end
