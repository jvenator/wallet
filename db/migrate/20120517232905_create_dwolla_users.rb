class CreateDwollaUsers < ActiveRecord::Migration
  def change
    create_table :dwolla_users do |t|
      t.string :uid
      t.string :access_token
      t.references :user

      t.timestamps
    end
  end
end
