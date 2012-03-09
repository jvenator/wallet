class FixFKsInDocumentPackages < ActiveRecord::Migration
  def up
    rename_column :document_packages, :documents_id, :document_id
    rename_column :document_packages, :packages_id, :package_id
  end

  def down
  end
end
