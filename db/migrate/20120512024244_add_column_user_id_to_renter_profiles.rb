class AddColumnUserIdToRenterProfiles < ActiveRecord::Migration
  change_table(:renter_profiles) do |t|
    t.references :user
  end
end
