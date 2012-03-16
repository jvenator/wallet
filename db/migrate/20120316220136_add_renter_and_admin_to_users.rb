class AddRenterAndAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :renter, :boolean, :default => false

    add_column :users, :admin, :boolean, :default => false

  end
end
