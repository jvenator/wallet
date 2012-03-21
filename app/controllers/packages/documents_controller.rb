class Packages::DocumentsController < ApplicationController
#  before_filter authenticate_user!
  def create
    @package = Package.find(params[:package_id])
    Document.where(["id IN (?)", params[:id]]).each do |d|
    #Looks for document records with the params ID
      @package.add_document(d)
    end
    @documents = current_user.documents.where(["id NOT IN (?)", @package.document_ids]).order("name asc")
    render("refresh_document_selector", :status => :created)
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
