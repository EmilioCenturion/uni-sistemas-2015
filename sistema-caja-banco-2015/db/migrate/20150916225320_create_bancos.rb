class CreateBancos < ActiveRecord::Migration
  def change
    create_table :bancos do |t|
      t.string :nombre
      t.string :direccion
      t.string :telefono
      t.string :correo
      t.string :sucursal
      t.references :pai, index: true
      t.references :ciudad, index: true

      t.timestamps
    end
  end
end
