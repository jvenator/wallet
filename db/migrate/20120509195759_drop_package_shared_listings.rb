class DropPackageSharedListings < ActiveRecord::Migration
  def up
    drop_table :package_shared_listings
  end

  def down
  end
end
