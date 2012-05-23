class CreateDocumentCategories < ActiveRecord::Migration
  def change
    create_table :document_categories do |t|
    	t.string :user_type
    	t.string :name
    	t.string :description

      t.timestamps
    end
  end
end
