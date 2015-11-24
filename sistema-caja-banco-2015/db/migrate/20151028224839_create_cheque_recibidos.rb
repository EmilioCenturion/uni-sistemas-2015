class CreateChequeRecibidos < ActiveRecord::Migration
  def change
    create_table :cheque_recibidos do |t|
      t.integer :nro_cheque
      t.references :banco, index: true
      t.decimal :monto, default: 0 
      t.date :fecha
      t.string :concepto
      t.references :cliente, index: true

      t.timestamps
    end
  end
end
