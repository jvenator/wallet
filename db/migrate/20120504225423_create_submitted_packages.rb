class CreateSubmittedPackages < ActiveRecord::Migration
  def change
    create_table :submitted_packages do |t|
      t.references :package
      t.references :listing
      t.string :token

      t.timestamps
    end
    add_index :submitted_packages, :package_id
    add_index :submitted_packages, :listing_id
  end
end
