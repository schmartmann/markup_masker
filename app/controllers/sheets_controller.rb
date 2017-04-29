class SheetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sheet
  
  def show 
  end

  def edit
  end

  def destroy
    redirect_to "/excel_sheets/#{@sheet.excel_sheet_id}"
  end

  private

  def set_sheet
    @sheet = Sheet.where(id: params[:id], user_id: current_user.id).joins(:columns).first
  end

end

