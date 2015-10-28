class CreateCajas < ActiveRecord::Migration
  def change
    create_table :cajas do |t|
      t.integer :nro_caja
      t.decimal :saldo_inicial_efectivo
      t.decimal :saldo_inicial_cheque
      t.string :estado

      t.timestamps
    end
  end
end
