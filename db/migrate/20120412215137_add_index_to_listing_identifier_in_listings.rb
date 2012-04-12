class AddIndexToListingIdentifierInListings < ActiveRecord::Migration
  def change
    add_index :listings, :identifier
  end
end
