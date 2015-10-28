class CreateAperturaCajas < ActiveRecord::Migration
  def change
    create_table :apertura_cajas do |t|
      t.references :caja, index: true
      t.datetime :apertura
      t.datetime :cierre
      t.decimal :saldo_inicial_efectivo
      t.decimal :saldo_inicial_cheque
      t.decimal :saldo_final_efectivo
      t.decimal :saldo_final_cheque
      t.references :user, index: true

      t.timestamps
    end
  end
end
