class CreateBancos < ActiveRecord::Migration
  def change
    create_table :bancos do |t|
      t.string :nombre
      t.string :direccion
      t.string :telefono

      t.timestamps
    end
  end
end
