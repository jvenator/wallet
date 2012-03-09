class Packages::DocumentsController < ApplicationController
  def create
    @package = Package.find(params[:package_id])
    @documents = Document.find(params[:document_ids])
    @documents.each do |d|
      @package.document_packages.create(:document => d)
    end
    
    render :nothing
  end
end
