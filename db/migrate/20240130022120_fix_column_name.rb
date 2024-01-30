class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :date, :publish_date
  end
end
