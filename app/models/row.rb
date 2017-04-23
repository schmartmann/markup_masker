class Row < ApplicationRecord
  default_scope { order("id ASC") }
  belongs_to :column
end
