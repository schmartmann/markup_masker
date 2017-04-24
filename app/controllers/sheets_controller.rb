class SheetsController < ApplicationController
  before_action :authenticate_user!
  
  def show 
    sheet = Sheet.where(id: params[:id], user_id: current_user.id).joins(:columns)
    @sheet = sheet[0]
  end

end
