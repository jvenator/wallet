class ChangeFieldNamesInPackageSharedListings < ActiveRecord::Migration
  def change
    rename_column :package_shared_listings, :listing_id, :shared_listing_id
  end
end
