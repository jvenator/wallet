class RemoveColumnsFromUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.remove :mobile_num, :home_num, :fax_num, :address_1, :address_2, :city, :state, :zip
    end
  end

  def down
  end
end
