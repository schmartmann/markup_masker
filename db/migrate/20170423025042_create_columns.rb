class CreateColumns < ActiveRecord::Migration[5.0]
  def change
    create_table :columns do |t|
      t.string :header
      t.integer :column_number
      t.references :sheet, foreign_key: true

      t.timestamps
    end
  end
end
