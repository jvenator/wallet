class UserRoles < ActiveRecord::Migration
  def change
    create_table (:user_roles) do |t|
      t.references :user
      t.references :role

      t.timestamps
    end
  end

end
