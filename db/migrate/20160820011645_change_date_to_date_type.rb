class ChangeDateToDateType < ActiveRecord::Migration[5.0]
  def change
    change_column :entries, :date, :date
  end
end
