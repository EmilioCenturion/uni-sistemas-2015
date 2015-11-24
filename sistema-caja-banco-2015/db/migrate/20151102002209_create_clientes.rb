class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :representante
      t.string :ruc
      t.integer :telefono
      t.string :email
      t.string :direccion
      t.references :pai, index: true
      t.references :ciudad, index: true

      t.timestamps
    end
  end
end
