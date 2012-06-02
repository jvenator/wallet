class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.date :from_date
      t.date :to_date
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country

      t.timestamps
    end
  end
end
