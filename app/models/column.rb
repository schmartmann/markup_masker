class Column < ApplicationRecord
  belongs_to :sheet
  has_many :rows
end

