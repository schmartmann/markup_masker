class ColumnsController < ApplicationController
  def show
    column = Column.where(id: params[:id]).joins(:rows)
    @column = column[0]
  end
end
