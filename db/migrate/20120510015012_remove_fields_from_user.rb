class RemoveFieldsFromUser < ActiveRecord::Migration
  def up
    User.find_each do |u|
      if u.owner_rep
        u.assign_role(:manager)
      end
      if u.renter
        u.assign_role(:renter)
      end
      if u.admin
        u.assign_role(:admin)
      end
    end

    remove_column :users, :owner_rep
    remove_column :users, :renter
    remove_column :users, :admin
  end

  def down

  end
end
