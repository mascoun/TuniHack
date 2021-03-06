class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
      t.string :category
      t.integer :number
      t.references :hospital, foreign_key: true
      t.boolean :approved, default: false
      t.string :blockHash

      t.timestamps
    end
  end
end
