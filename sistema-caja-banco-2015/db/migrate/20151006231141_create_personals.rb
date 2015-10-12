class CreatePersonals < ActiveRecord::Migration
  def change
    create_table :personals do |t|
      t.string :nombre
      t.integer :documento
      t.integer :telefono
      t.string :email
      t.string :direccion
      t.references :pai, index: true
      t.references :ciudad, index: true

      t.timestamps
    end
  end
end
