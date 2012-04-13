class RenamePackageListings < ActiveRecord::Migration
  def up
    rename_table :package_listings, :package_shared_listings
  end

  def down
    rename_table :package_shared_listings, :package_listings
  end
end
