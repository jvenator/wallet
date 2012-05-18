class CreateDropboxUsers < ActiveRecord::Migration
  def change
    create_table :dropbox_users do |t|
      t.string :uid
      t.string :access_key
      t.string :access_secret
      t.references :user

      t.timestamps
    end
  end
end
