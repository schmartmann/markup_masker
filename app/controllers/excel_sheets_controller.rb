class ExcelSheetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_excel_sheet, only: [:show, :edit, :update, :destroy, :remove]
  require 'roo'
  require 'roo-xls'
  require 'mimemagic'

  def index
    @excel_sheets = ExcelSheet.all.where(user_id: current_user.id)
  end

  def show
  end

  def new 
    @excel_sheet = ExcelSheet.new
  end
  
  def create 
    spreadsheet = params[:excel_sheet][:spreadsheet]
    if spreadsheet.original_filename.split(".")[-1] == "xlsx"
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
    else 
      redirect_to "/excel_sheets/new"
      flash[:filetype] = "Oops! Make sure you're uploading an Excel file!"
    end
  end

  def edit
  end

  def update
    @excel_sheet.update(
      name: params[:excel_sheet][:name]
    )
    redirect_to "/excel_sheets"
  end

  def destroy
  end

  def remove
  end

  private

  def set_excel_sheet
    @excel_sheet = ExcelSheet.where(id: params[:id]).joins(:sheets).first
  end

end
