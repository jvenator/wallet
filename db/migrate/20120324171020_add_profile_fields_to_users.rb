class AddProfileFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mobile_num, :string

    add_column :users, :home_num, :string

    add_column :users, :fax_num, :string

    add_column :users, :address_1, :string

    add_column :users, :address_2, :string

    add_column :users, :city, :string

    add_column :users, :state, :string

    add_column :users, :zip, :string

  end
end
