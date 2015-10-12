class CreateChequeras < ActiveRecord::Migration
  def change
    create_table :chequeras do |t|
      t.integer :nro_primero
      t.integer :nro_ultimo
      t.references :cuentum, index: true
      t.references :personal, index: true

      t.timestamps
    end
  end
end
