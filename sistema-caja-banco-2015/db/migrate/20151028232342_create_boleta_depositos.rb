class CreateBoletaDepositos < ActiveRecord::Migration
  def change
    create_table :boleta_depositos do |t|
      t.integer :nro_boleta
      t.decimal :monto_efectivo, default: 0 
      t.decimal :monto_cheque, default: 0 
      t.date :fecha
      t.references :cuenta, index: true
      t.references :apertura_caja, index: true

      t.timestamps
    end
  end
end
