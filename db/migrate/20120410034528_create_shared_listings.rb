class CreateSharedListings < ActiveRecord::Migration
  def change
    create_table :shared_listings do |t|
      t.string :receiver_type
      t.integer :receiver_id
      t.integer :listing_id
      t.integer :sender_id
      t.string :receiver_email
      t.string :listing_identifier
      t.string :package_identifier

      t.timestamps
    end
  end
end
