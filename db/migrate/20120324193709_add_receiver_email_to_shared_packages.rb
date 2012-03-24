class AddReceiverEmailToSharedPackages < ActiveRecord::Migration
  def change
    add_column :shared_packages, :receiver_email, :string

  end
end
