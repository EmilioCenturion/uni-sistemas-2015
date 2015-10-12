class CreateCuenta < ActiveRecord::Migration
  def change
    create_table :cuenta do |t|
      t.integer :nro_cuenta
      t.decimal :saldo
      t.references :banco, index: true

      t.timestamps
    end
  end
end
