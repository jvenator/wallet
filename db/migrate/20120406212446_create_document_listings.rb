class CreateDocumentListings < ActiveRecord::Migration
  def change
    create_table :document_listings do |t|
      t.references :documents
      t.references :listings

      t.timestamps
    end
  end
end
