class CreateCajas < ActiveRecord::Migration
  def change
    create_table :cajas do |t|
      t.integer :nro_caja
      t.datetime :apertura
      t.datetime :cierre
      t.decimal :saldo_inicial_efectivo
      t.decimal :saldo_inicial_cheque
      t.decimal :saldo_final_efectivo
      t.decimal :saldo_final_cheque
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
