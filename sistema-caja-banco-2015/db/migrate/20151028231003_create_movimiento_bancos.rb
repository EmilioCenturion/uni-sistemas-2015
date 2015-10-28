class CreateMovimientoBancos < ActiveRecord::Migration
  def change
    create_table :movimiento_bancos do |t|
      t.references :cuenta, index: true
      t.references :motivo_movimiento_banco, index: true
      t.string :descripcion
      t.boolean :es_ingreso
      t.decimal :monto_efectivo
      t.decimal :monto_cheque
      t.datetime :fecha

      t.timestamps
    end
  end
end
