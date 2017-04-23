class AddForeignKeysToSheets < ActiveRecord::Migration[5.0]
  def change
    add_column :sheets, :spreadsheet_id, :integer, :references => "spreadsheets" 
  end
end
