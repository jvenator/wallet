class AddColumnDocumentCategoryToDocuments < ActiveRecord::Migration
  def up
  	change_table :documents do |t|
  		t.references :document_category
  	end
  end

  def down
  	change_table :documents do |t|
  		t.remove :document_category
  	end
  end
end
