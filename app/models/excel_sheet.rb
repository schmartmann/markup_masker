class ExcelSheet < ApplicationRecord
  belongs_to :user
  has_many :sheets
end
