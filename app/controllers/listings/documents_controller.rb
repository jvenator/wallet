class Listings::DocumentsController < ApplicationController
#  before_filter authenticate_user!
  def create
    @listing = Listing.find(params[:listing_id])
    Document.where(["id IN (?)", params[:id]]).each do |d|
    #Looks for document records with the params ID
      @listing.add_document(d)
    end
    @documents = current_user.documents.where(["id NOT IN (?)", @listing.document_ids]).order("name asc")
    render("refresh_document_selector", :status => :created)
  end
  def destroy
    @listing = Listing.find(params[:listing_id])
    @listing.remove_document(Document.find(params[:id]))
    
    if !@listing.document_ids.empty?
      @documents = current_user.documents.where(["id NOT IN (?)",
                    @listing.document_ids]).order("name asc")
      else
      @documents = current_user.documents.order("name asc")
    end
    render("refresh_document_selector", :status => :ok)  
  end
  
  
end
