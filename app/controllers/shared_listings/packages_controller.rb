class Share_Listings::PackagesController < ApplicationController
#  before_filter authenticate_user!
  def create
    @shared_listing = Listing.find(params[:listing_id])
    Package.where(["id IN (?)", params[:id]]).each do |d|
    #Looks for document records with the params ID
      @shared_lising.add_package(d)
    end
    @packages = current_user.packages.where(["id NOT IN (?)", @shared_listing.package_ids]).order("name asc")
    render("refresh_package_selector", :status => :created)
  end
  def destroy
    @package = Package.find(params[:package_id])
    @package.remove_document(Document.find(params[:id]))
    
    if !@package.document_ids.empty?
      @documents = current_user.documents.where(["id NOT IN (?)",
                    @package.document_ids]).order("name asc")
      else
      @documents = current_user.documents.order("name asc")
    end
    render("refresh_document_selector", :status => :ok)  
  end
  
  
end
