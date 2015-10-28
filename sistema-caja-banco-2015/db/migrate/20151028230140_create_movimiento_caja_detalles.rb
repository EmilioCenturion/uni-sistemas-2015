class CreateMovimientoCajaDetalles < ActiveRecord::Migration
  def change
    create_table :movimiento_caja_detalles do |t|
      t.references :movimiento_caja, index: true
      t.references :cheque_recibido, index: true

      t.timestamps
    end
  end
end
