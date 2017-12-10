class CreateHospitals < ActiveRecord::Migration[5.0]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.text :description
      t.string :distance
      t.string :place
      t.string :tel
      t.string :web
      t.boolean :approved, default: false
      t.string :blockHash
      t.string :photo

      t.timestamps
    end
  end
end
