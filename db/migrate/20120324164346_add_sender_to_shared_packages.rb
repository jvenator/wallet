class AddSenderToSharedPackages < ActiveRecord::Migration
  def change
    add_column :shared_packages, :sender_id, :integer

  end
end
