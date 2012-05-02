class ListingsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /listings
  # GET /listings.json
  def index
    @listings = current_user.listings
    @shared_listings = current_user.shared_listings

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @listings }
    end
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @listing = current_user.listings.find(params[:id])
    @documents = current_user.documents-@listing.documents
    @shared_listings = @listing.shared_listings

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @listing }
    end
  end

  # GET /listings/new
  # GET /listings/new.json
  def new
    @listing = Listing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @listing }
    end
  end

  # GET /listings/1/edit
  def edit
    @listing = current_user.listings.find(params[:id])
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = current_user.listings.build(params[:listing])

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render json: @listing, status: :created, location: @listing }
      else
        format.html { render action: "new" }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /listings/1
  # PUT /listings/1.json
  def update
    @listing = current_user.listings.find(params[:id])

    respond_to do |format|
      if @listing.update_attributes(params[:listing])
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing = current_user.listings.find(params[:id])
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end
  
  def share
    listing = current_user.listings.find(params[:id])
    target = params[:email].downcase
    shared_listing = listing.share_listing(current_user, target)
    
    if shared_listing.persisted?
      flash[:notice] = "Listing shared successfully"
    else
      flash[:notice] = shared_listing.errors.full_messages.first
    end
    
    redirect_to listing_path(listing)
  end
end
