class CreateCajas < ActiveRecord::Migration
  def change
    create_table :cajas do |t|
      t.integer :nro_caja
      t.decimal :saldo_inicial_efectivo, default: 0 
      t.decimal :saldo_inicial_cheque, default: 0 
      t.string :estado, default: 'Cerrado'

      t.timestamps
    end
  end
end
