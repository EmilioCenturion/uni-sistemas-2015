class CreateMotivoMovimientoCajas < ActiveRecord::Migration
  def change
    create_table :motivo_movimiento_cajas do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
