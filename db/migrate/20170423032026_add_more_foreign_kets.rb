class AddMoreForeignKets < ActiveRecord::Migration[5.0]
  def change
    remove_column :sheets, :spreadsheet_id
    add_column :sheets, :excel_sheet_id, :integer, :references => "excel_sheets" 
  end
end
