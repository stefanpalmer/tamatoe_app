class AddCategoryIdToEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :category_id, :integer
  end
end
