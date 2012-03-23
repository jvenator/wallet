class AddUserIdToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :user_id, :integer
  end
end
