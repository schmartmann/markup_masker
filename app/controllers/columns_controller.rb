class ColumnsController < ApplicationController
  helper ColumnsHelper
  def show
    column = Column.where(id: params[:id]).joins(:rows)
    @column = column[0]
    @column.rows.each do |row|
      Row.html_breaker(row)
    end
  end
end
