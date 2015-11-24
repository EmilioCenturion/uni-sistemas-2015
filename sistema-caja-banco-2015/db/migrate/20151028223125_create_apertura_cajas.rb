class CreateAperturaCajas < ActiveRecord::Migration
  def change
    create_table :apertura_cajas do |t|
      t.references :caja, index: true
      t.datetime :apertura
      t.datetime :cierre
      t.decimal :saldo_inicial_efectivo, default: 0 
      t.decimal :saldo_inicial_cheque, default: 0 
      t.decimal :saldo_final_efectivo, default: 0 
      t.decimal :saldo_final_cheque, default: 0 
      t.references :user, index: true

      t.timestamps
    end
  end
end
