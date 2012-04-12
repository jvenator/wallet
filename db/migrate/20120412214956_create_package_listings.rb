class CreatePackageListings < ActiveRecord::Migration
  def change
    create_table :package_listings do |t|
      t.references :package
      t.references :listing
      t.string :listing_identifier

      t.timestamps
    end
    add_index :package_listings, :package_id
    add_index :package_listings, :listing_id
  end
end
