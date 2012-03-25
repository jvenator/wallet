class AddColumnManagerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :manager, :boolean

  end
end
