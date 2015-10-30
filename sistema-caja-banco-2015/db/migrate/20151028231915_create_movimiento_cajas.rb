class CreateMovimientoCajas < ActiveRecord::Migration
  def change
    create_table :movimiento_cajas do |t|
      t.references :apertura_caja, index: true
      t.references :motivo_movimiento_caja, index: true
      t.string :descripcion
      t.boolean :es_ingreso
      t.decimal :monto_efectivo, default: 0 
      t.decimal :monto_cheque, default: 0 
      t.datetime :fecha

      t.timestamps
    end
  end
end
