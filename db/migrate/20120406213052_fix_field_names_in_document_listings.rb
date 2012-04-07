class FixFieldNamesInDocumentListings < ActiveRecord::Migration
  def up
    rename_column :document_listings, :documents_id, :document_id
    rename_column :document_listings, :listings_id, :listing_id
  end

  def down
  end
end
