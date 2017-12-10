class CreateBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :blocks do |t|
      t.integer :index, default: 1
      t.string :data, array: true, default: "--- []\n"
      t.string :blockHash
      t.references :block

      t.timestamps
    end
  end
end
