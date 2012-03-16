class AddUserIdToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :user_id, :reference

  end
end
