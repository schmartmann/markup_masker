class ColumnsController < ApplicationController
  include ColumnsHelper
  def show
    column = Column.where(id: params[:id]).joins(:rows)
    @column = column[0]
    rows = @column.rows
    @rows = []
    rows.each do |line|
      @rows.push(
        {
          content: html_breaker(line[:raw_text])
        }
      )
    end
    byebug
  end

end
