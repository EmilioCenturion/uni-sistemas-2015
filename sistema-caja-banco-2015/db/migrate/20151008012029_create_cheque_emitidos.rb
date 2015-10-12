class CreateChequeEmitidos < ActiveRecord::Migration
  def change
    create_table :cheque_emitidos do |t|
      t.integer :nro_cheque
      t.decimal :monto
      t.date :fecha
      t.references :chequera, index: true
      t.string :concepto

      t.timestamps
    end
  end
end
