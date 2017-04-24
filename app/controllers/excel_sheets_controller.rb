class ExcelSheetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @excel_sheets = ExcelSheet.all.where(user_id: current_user.id)
  end

  def show
    @excel_sheet = ExcelSheet.where(id: params[:id]).joins(:sheets)
  end
end
