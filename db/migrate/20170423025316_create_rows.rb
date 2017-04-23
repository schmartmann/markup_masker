class CreateRows < ActiveRecord::Migration[5.0]
  def change
    create_table :rows do |t|
      t.string :raw_text
      t.integer :row_number
      t.references :column, foreign_key: true

      t.timestamps
    end
  end
end
