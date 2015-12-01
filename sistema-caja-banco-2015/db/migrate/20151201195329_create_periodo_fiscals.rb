class CreatePeriodoFiscals < ActiveRecord::Migration
  def change
    create_table :periodo_fiscals do |t|
      t.date :fecha_inicio
      t.date :fecha_fin
      t.string :anho
      t.boolean :activo

      t.timestamps
    end
  end
end
