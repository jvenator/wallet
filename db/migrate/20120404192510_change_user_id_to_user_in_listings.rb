class ChangeUserIdToUserInListings < ActiveRecord::Migration
  change_table :listings do |t|
    t.rename :user_id_id, :user_id
  end
end
