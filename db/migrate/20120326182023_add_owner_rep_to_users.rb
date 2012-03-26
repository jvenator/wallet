class AddOwnerRepToUsers < ActiveRecord::Migration
  def change
    add_column :users, :owner_rep, :boolean
    
    remove_column :users, :broker
    remove_column :users, :manager

  end
end
