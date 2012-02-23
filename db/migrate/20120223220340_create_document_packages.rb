class CreateDocumentPackages < ActiveRecord::Migration
  def change
    create_table :document_packages do |t|
      t.references :documents
      t.references :packages

      t.timestamps
    end
  end
end
