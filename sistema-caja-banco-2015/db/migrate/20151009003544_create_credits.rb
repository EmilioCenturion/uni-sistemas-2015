class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.integer :nro_tarjeta
      t.references :cuentum, index: true
      t.references :personal, index: true

      t.timestamps
    end
  end
end
