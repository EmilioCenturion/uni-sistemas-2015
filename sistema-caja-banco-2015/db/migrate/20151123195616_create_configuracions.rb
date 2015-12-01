class CreateConfiguracions < ActiveRecord::Migration
  def change
    create_table :configuracions do |t|
      t.string :nombre_empresa
      t.string :direccion
      t.string :correo
      t.string :telefono
      t.string :logo_empresa
      t.string :cabecera_impresion
      t.integer :tiempo_espera

      t.timestamps
    end
  end
end
