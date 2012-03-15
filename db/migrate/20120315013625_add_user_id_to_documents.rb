class AddUserIdToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :user_id, :reference

  end
end
