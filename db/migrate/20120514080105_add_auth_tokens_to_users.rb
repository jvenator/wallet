class AddAuthTokensToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_token, :string
    add_column :users, :dwolla_token, :string
  end
end
