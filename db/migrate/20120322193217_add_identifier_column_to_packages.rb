class AddIdentifierColumnToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :identifier, :string

  end
end
