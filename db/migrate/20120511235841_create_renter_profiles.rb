class CreateRenterProfiles < ActiveRecord::Migration
  def change
    create_table :renter_profiles do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :mobile_num
      t.string :home_num
      t.string :work_num
      t.string :fax_num
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.date :date_of_birth

      t.timestamps
    end
  end
end
