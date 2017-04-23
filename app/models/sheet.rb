class Sheet < ApplicationRecord
  belongs_to :user
  belongs_to :excel_sheet
  has_many :columns
end
