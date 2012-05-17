class AddAsOfDateToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :as_of_date, :date
  end
end
