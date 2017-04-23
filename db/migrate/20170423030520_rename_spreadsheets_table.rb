class RenameSpreadsheetsTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :spreadsheets, :excel_sheets
  end
end
