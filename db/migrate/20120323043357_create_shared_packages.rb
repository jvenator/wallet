class CreateSharedPackages < ActiveRecord::Migration
  def change
    create_table :shared_packages do |t|
      t.string :receiver_type
      t.integer :receiver_id
      t.integer :package_id
      t.timestamps
    end
  end
end
