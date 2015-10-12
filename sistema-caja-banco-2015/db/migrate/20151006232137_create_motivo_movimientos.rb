class CreateMotivoMovimientos < ActiveRecord::Migration
  def change
    create_table :motivo_movimientos do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
