class CreateMotivoMovimientoBancos < ActiveRecord::Migration
  def change
    create_table :motivo_movimiento_bancos do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
