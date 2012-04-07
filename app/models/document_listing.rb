class DocumentListing < ActiveRecord::Base
  belongs_to :listing
  belongs_to :document
  validates :document_id, :uniqueness => { :scope => :listing_id }
end