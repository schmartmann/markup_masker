# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'roo'
require 'roo-xls'

Row.destroy_all
Column.destroy_all
Sheet.destroy_all
ExcelSheet.destroy_all


xlsx = Roo::Spreadsheet.open('./db/Textool_Update_April_May_Projects_03312017.xlsx')

@spreadsheet = ExcelSheet.create({
  name: xlsx.info.split(" ")[1],
  user_id: 1
})

doc_sheets = xlsx.sheets

doc_sheets.each do |sheet|
  @sheet = Sheet.create({
    name: sheet,
    user_id: 1,
    excel_sheet_id: @spreadsheet.id
  })
  col_count = xlsx.sheet(sheet).last_column
  col_count_arr = (1..col_count).to_a
  col_count_arr.each do |col_num|
    xlsx.sheet(sheet).column(col_num)
    @column = Column.create({
      header: xlsx.sheet(sheet).column(col_num)[0],
      column_number: col_num,
      sheet_id: @sheet.id
    })
    xlsx.sheet(sheet).column(col_num).each_with_index do |hash, index|
      Row.create({
        raw_text: hash,
        row_number: index,
        column_id: @column.id
      })
    end
  end
end
