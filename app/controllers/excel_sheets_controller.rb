class ExcelSheetsController < ApplicationController
  before_action :authenticate_user!
  require 'roo'
  require 'roo-xls'

  def index
    @excel_sheets = ExcelSheet.all.where(user_id: current_user.id)
  end

  def show
    @excel_sheet = ExcelSheet.where(id: params[:id]).joins(:sheets).first
  end

  def new 
    @excel_sheet = ExcelSheet.new
  end
  
  def create 
    spreadsheet = params[:excel_sheet][:spreadsheet]
    xlsx = Roo::Spreadsheet.open(spreadsheet.tempfile)
    @spreadsheet = ExcelSheet.create(
      name: spreadsheet.original_filename,
      user_id: current_user.id
    )
    doc_sheets = xlsx.sheets
    doc_sheets.each do |sheet|
      @sheet = Sheet.create({
        name: sheet,
        user_id: current_user.id,
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
    redirect_to "/excel_sheets"
  end

end

