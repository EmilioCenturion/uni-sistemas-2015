class CreateAsientos < ActiveRecord::Migration
  def change
    create_table :asientos do |t|
      t.integer :nro_asiento
      t.date :fecha
      t.string :concepto
      t.references :periodo_fiscal, index: true

      t.timestamps
    end
  end
end
