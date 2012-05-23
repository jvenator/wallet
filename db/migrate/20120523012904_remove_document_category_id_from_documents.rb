class RemoveDocumentCategoryIdFromDocuments < ActiveRecord::Migration
  def up
  	change_table :documents do |t|
  		t.remove :document_category_id
  	end
  end

  def down
  end
end
