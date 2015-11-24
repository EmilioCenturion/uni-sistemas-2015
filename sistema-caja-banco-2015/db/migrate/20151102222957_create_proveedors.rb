class CreateProveedors < ActiveRecord::Migration
  def change
    create_table :proveedors do |t|
      t.string :nombre
      t.string :representante
      t.string :ruc
      t.string :direccion
      t.integer :telefono
      t.references :ciudad, index: true
      t.references :pai, index: true

      t.timestamps
    end
  end
end
