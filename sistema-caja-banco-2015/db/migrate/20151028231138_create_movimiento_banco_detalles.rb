class CreateMovimientoBancoDetalles < ActiveRecord::Migration
  def change
    create_table :movimiento_banco_detalles do |t|
      t.references :movimiento_banco, index: true
      t.references :cheque_recibido, index: true

      t.timestamps
    end
  end
end
