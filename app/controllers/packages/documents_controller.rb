class Packages::DocumentsController < ApplicationController
  def create
    @package = Package.find(params[:package_id])
    Document.where(["id IN (?)", params[:id]]).each do |d|
      @package.add_document(d)
    end
    @documents = Document.where(["id NOT IN (?)", @package.document_ids])
    render("refresh_document_selector", :status => :created)
  end
  def destroy
    @package = Package.find(params[:package_id])
    @package.remove_document(Document.find(params[:id]))
    
    @documents = Document.where(["id NOT IN (?)", @package.document_ids])
    render("refresh_document_selector", :status => :ok)
  end
end
