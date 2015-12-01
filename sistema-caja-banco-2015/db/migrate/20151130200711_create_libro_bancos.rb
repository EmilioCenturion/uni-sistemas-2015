class CreateLibroBancos < ActiveRecord::Migration
  def change
    create_table :libro_bancos do |t|
      t.references :cuenta, index: true
      t.date :fecha_inicio
      t.date :fecha_fin

      t.timestamps
    end
  end
end
