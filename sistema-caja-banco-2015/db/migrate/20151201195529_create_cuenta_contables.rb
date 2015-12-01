class CreateCuentaContables < ActiveRecord::Migration
  def change
    create_table :cuenta_contables do |t|
      t.string :tipo_cuenta
      t.integer :nivel_cuenta
      t.integer :codigo_cuenta
      t.string :descripcion

      t.timestamps
    end
  end
end
