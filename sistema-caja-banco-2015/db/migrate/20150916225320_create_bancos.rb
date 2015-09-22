class CreateBancos < ActiveRecord::Migration
  def change
    create_table :bancos do |t|
      t.string :nombre
      t.string :direccion
      t.string :telefono
      t.string :correo
      t.integer :ciudad
      t.integer :pais

      t.timestamps
    end
  end
end
